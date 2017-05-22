# frozen_string_literal: true

json.extract! product, :id, :barcode, :name, :value, :created_at, :updated_at
json.url product_url(product, format: :json)
