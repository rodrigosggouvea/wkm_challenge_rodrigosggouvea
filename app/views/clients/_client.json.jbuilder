# frozen_string_literal: true

json.extract! client, :id, :name, :cpf, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
