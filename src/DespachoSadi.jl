module DespachoSadi

using PowerModels
using JuMP
using CasosProgramacionDiaria
using PSSEModels
using Dates
const _PM = PowerModels
const _IM = PowerModels.InfrastructureModels

include("escenario.jl")

export obtener_escenario

end # module DespachoSadi
