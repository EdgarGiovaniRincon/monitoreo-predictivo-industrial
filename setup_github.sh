#!/usr/bin/env bash
# Crea el repositorio en GitHub, sube todo y arma la planeación (labels, sprints, historias y tablero).
# Requisitos: git y GitHub CLI (https://cli.github.com) con sesión iniciada:  gh auth login
#             y permiso de proyectos:                                           gh auth refresh -s project
# Uso: ./setup_github.sh [usuario-github-del-docente]
set -e
REPO="monitoreo-predictivo-industrial"
DOCENTE="$1"

git init -b main
git add .
git commit -m "Estructura inicial del proyecto"
gh repo create "$REPO" --public --source=. --remote=origin --push
OWNER=$(gh repo view --json owner -q .owner.login)

if [ -n "$DOCENTE" ]; then
  gh api -X PUT "repos/$OWNER/$REPO/collaborators/$DOCENTE" -f permission=push
  echo "Invitación enviada a $DOCENTE"
fi

gh label create historia-de-usuario --color 0E7FA8 --force
gh label create tarea-tecnica --color 6F42C1 --force
gh label create prioridad-alta --color B83A2B --force
gh label create prioridad-media --color D9A441 --force
gh label create prioridad-baja --color 2E7D52 --force
for n in 1 2 3 4; do gh api "repos/$OWNER/$REPO/milestones" -f title="Sprint $n" >/dev/null; done

issue(){ # título, etiquetas, sprint, cuerpo
  gh issue create --title "$1" --label "$2" --milestone "$3" --body "$4"
}
issue "HU-01 Ver los sensores en vivo" "historia-de-usuario,prioridad-alta" "Sprint 1" "Como técnico quiero ver los sensores en vivo para conocer el estado de cada motor.

## Criterios de aceptación
- [ ] El dashboard se actualiza al menos cada 5 segundos."
issue "Modelo LSTM de anomalías" "tarea-tecnica,prioridad-alta" "Sprint 2" "Entrenar un autoencoder LSTM con series de tiempo de los sensores para detectar anomalías.

## Criterios de aceptación
- [ ] El modelo se entrena con datos de data/processed.
- [ ] Se evalúa y se guarda en ml-models/models."
issue "HU-02 Recibir alertas automáticas" "historia-de-usuario,prioridad-alta" "Sprint 2" "Como técnico quiero recibir una alerta cuando haya una anomalía para actuar antes de la falla.

## Criterios de aceptación
- [ ] La alerta indica el equipo, el sensor y la gravedad."
issue "HU-03 Predicción de falla y causa" "historia-de-usuario,prioridad-media" "Sprint 3" "Como supervisor quiero saber cuándo y por qué fallará una pieza para programar el mantenimiento.

## Criterios de aceptación
- [ ] Se muestran los días estimados y la causa probable."
issue "HU-04 Registro de equipos y límites" "historia-de-usuario,prioridad-media" "Sprint 3" "Como administrador quiero registrar equipos y límites de alarma para que el sistema los vigile.

## Criterios de aceptación
- [ ] Se puede agregar, editar y eliminar un equipo."
issue "HU-05 Historial y reportes" "historia-de-usuario,prioridad-baja" "Sprint 4" "Como supervisor quiero consultar el historial de alertas para revisar los paros evitados.

## Criterios de aceptación
- [ ] Se filtra por fecha y equipo.
- [ ] Se exporta a CSV."

# Tablero (GitHub Projects) con los issues
NUM=$(gh project create --owner "@me" --title "Monitoreo predictivo - Backlog" --format json -q .number)
gh project link "$NUM" --owner "@me" --repo "$OWNER/$REPO" || true
for u in $(gh issue list --json url -q '.[].url'); do gh project item-add "$NUM" --owner "@me" --url "$u"; done
echo "Listo: https://github.com/$OWNER/$REPO"
