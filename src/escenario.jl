"""
    obtener_escenario(fecha::DateTime, model_type, optimizer)

Obtiene los datos del escenario para una `fecha` dada, mapeando la programación diaria al
caso base de PSS/E y ejecutando una estimación de estado con el `optimizer` y el `model_type`
especificados.
"""
function obtener_escenario(fecha::DateTime, model_type, optimizer)
    prog = CasosProgramacionDiaria.get_programacion_diaria(fecha)
    data = CasosProgramacionDiaria.get_base_case(fecha)

    CasosProgramacionDiaria.set_voltage_bounds!(data)
    CasosProgramacionDiaria.map_generators_to_case!(data, prog)
    CasosProgramacionDiaria.map_flows_to_case!(data, prog)
    CasosProgramacionDiaria.map_bounds_to_case!(data, prog)
    CasosProgramacionDiaria.map_summary_to_case!(data, prog)
    CasosProgramacionDiaria.set_load_bounds!(data)

    # Estimación de estado
    CasosProgramacionDiaria.set_start_values!(data)
    results = CasosProgramacionDiaria.run_state_estimation(data, model_type, optimizer)
    update_data!(data, results["solution"])

    return data
end
