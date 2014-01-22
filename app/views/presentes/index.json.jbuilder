json.array!(@presentes) do |presente|
  json.extract! presente, :id, :nome, :valor, :foto, :url, :lista_id
  json.url presente_url(presente, format: :json)
end
