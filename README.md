# DespachoSadi

El objetivo principal es integrar la estimación de costos marginales (calibración) con el planeamiento de la expansión de la red de transmisión, utilizando datos operativos reales para cerrar la brecha entre el modelo y la realidad del sistema.

## Funcionalidades

- Arma varios escenarios de operación.
- Para cada escenario de operación genera un costo único de la máquina.

## Uso Básico

```julia
using DespachoSadi
using Ipopt
using JuMP
using Dates

optimizer = JuMP.optimizer_with_attributes(Ipopt.Optimizer, "print_level" => 0)
fecha = DateTime(2025, 6, 6, 20, 00)

# Obtener escenario con el modelo por defecto (ACPPowerModel)
data = obtener_escenario(fecha, optimizer)

# O especificar un tipo de modelo de PowerModels diferente
using PowerModels
data_dc = obtener_escenario(fecha, optimizer; model_type=DCPPowerModel)
```
