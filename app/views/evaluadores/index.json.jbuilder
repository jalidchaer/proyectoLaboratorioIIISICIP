json.array!(@evaluadores) do |evaluadore|
  json.extract! evaluadore, :id, :cedula, :apellido, :cedula, :titulo, :especializacion, :maestria, :doctorado, :universidad
  json.url evaluadore_url(evaluadore, format: :json)
end
