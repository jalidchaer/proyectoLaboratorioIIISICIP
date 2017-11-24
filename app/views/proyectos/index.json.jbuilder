json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :fecha, :codigo, :responsable, :titulo, :objetivogeneral, :objetivosespecifo, :resumen, :duracion, :monto, :estado
  json.url proyecto_url(proyecto, format: :json)
end
