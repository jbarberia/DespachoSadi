@testset "Escenario" begin
    fecha = DateTime(2025, 6, 6, 20, 00)
    data = obtener_escenario(fecha, ACPPowerModel, optimizer)
    @test data isa Dict
    @test haskey(data, "bus")
    @test haskey(data, "gen")
end
