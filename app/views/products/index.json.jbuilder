# frozen_string_literal: true

json.products @products do |product|
  json.id product.id
  json.barcode product.barcode
  json.name product.name
  json.value number_to_currency(product.value)
  json.url product_url(product, format: :json)
end
