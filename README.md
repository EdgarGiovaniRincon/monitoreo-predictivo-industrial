# Monitoreo industrial predictivo con IA e IoT

Sistema de monitoreo continuo con sensores industriales (vibración, temperatura, acústicos y consumo eléctrico) instalados en motores y maquinaria crítica. Un modelo LSTM analiza las series de tiempo, detecta anomalías, predice cuándo y por qué fallará una pieza y envía una alerta automática al equipo de mantenimiento.

## Problema
Las paradas no programadas por fallas mecánicas cuestan millones de pesos en tiempo de inactividad y reparaciones de emergencia.

## Tipo de aplicación
Aplicación web con dashboard, conectada a sensores IoT y a un modelo de IA.

## Actores
Técnico de mantenimiento, supervisor de planta y administrador.

## Herramientas
Python, TensorFlow/Keras, MQTT, InfluxDB, FastAPI, React, Docker y GitHub.

## Estructura
| Carpeta | Contenido |
|---|---|
| `docs/` | Documentación y planeación |
| `hardware-iot/` | Sensores y gateway |
| `data/` | Datos crudos y procesados |
| `ml-models/` | Modelos LSTM |
| `backend/` | API y alertas |
| `frontend/` | Dashboard y maquetado |
| `infra/` | Docker y CI/CD |
| `tests/` | Pruebas |

## Planeación
Historias de usuario, backlog y sprints: ver [docs/backlog.md](docs/backlog.md) y la pestaña **Projects** del repositorio.

## Equipo
[Integrantes del equipo]
