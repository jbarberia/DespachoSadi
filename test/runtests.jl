using DespachoSadi
using PowerModels
using Ipopt
using JuMP
using Test
using Dates

optimizer = JuMP.optimizer_with_attributes(
    Ipopt.Optimizer,
    "tol" => 1e-4,
    "max_iter" => 200,
    "print_level" => 5,
    "nlp_scaling_method" => "none",
)

@testset "DespachoSadi.jl" begin
    include("escenarios.jl")
end

# Limpieza de archivos temporales de datos
map(rm, [f for f in readdir() if occursin(r"^PD.*\.zip$", f)])    
        
