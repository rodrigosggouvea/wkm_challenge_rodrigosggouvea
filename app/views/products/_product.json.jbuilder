# frozen_string_literal: true

json.extract! product, :id, :barcode, :name, :value
json.url product_url(product, format: :json)
