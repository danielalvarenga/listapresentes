json.array!(@mensagens) do |mensagem|
  json.extract! mensagem, :id, :remetente, :texto, :presente_id
  json.url mensagem_url(mensagem, format: :json)
end
