# frozen_string_literal: true

json.extract! order, :id, :client_id, :date, :discount, :created_at, :updated_at
json.url order_url(order, format: :json)
