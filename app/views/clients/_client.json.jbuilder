# frozen_string_literal: true

json.extract! client, :id, :name, :cpf, :email
json.url client_url(client, format: :json)
