json.array!(@listas) do |lista|
  json.extract! lista, :id, :nome, :presenteados, :descricao, :foto, :user_id
  json.url lista_url(lista, format: :json)
end
