# Product Backlog

| Prioridad | Elemento | Historia | Sprint |
|---|---|---|---|
| 1 · Alta | Recibir datos de los sensores | HU-01 | 1 |
| 2 · Alta | Modelo LSTM de anomalías | Tarea técnica | 2 |
| 3 · Alta | Alertas automáticas | HU-02 | 2 |
| 4 · Media | Predicción de falla y causa | HU-03 | 3 |
| 5 · Media | Registro de equipos y límites | HU-04 | 3 |
| 6 · Baja | Historial y reportes | HU-05 | 4 |

## Historias de usuario

**HU-01.** Como técnico quiero ver los sensores en vivo para conocer el estado de cada motor.
- [ ] El dashboard se actualiza al menos cada 5 segundos.

**HU-02.** Como técnico quiero recibir una alerta cuando haya una anomalía para actuar antes de la falla.
- [ ] La alerta indica el equipo, el sensor y la gravedad.

**HU-03.** Como supervisor quiero saber cuándo y por qué fallará una pieza para programar el mantenimiento.
- [ ] Se muestran los días estimados y la causa probable.

**HU-04.** Como administrador quiero registrar equipos y límites de alarma para que el sistema los vigile.
- [ ] Se puede agregar, editar y eliminar un equipo.

**HU-05.** Como supervisor quiero consultar el historial de alertas para revisar los paros evitados.
- [ ] Se filtra por fecha y equipo.
- [ ] Se exporta a CSV.
