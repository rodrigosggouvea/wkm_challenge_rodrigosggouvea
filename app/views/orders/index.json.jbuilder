# frozen_string_literal: true

json.orders @orders do |order|
  json.id order.id
  json.status order.status
  json.date l(order.date)
  json.discount "#{order.discount.to_i}%"
  json.itens order.itens
  json.full_price number_to_currency(order.full_price)
  json.url order_url(order, format: :json)
  json.client_id order.client_id
  json.client_name order.client.name
  json.client_cpf order.client.cpf
  json.client_email order.client.email
  json.client_url client_url(order.client_id, format: :json)

  json.product_orders order.product_orders do |po|
    json.quantity po.quantity
    json.product_id po.product_id
    json.product_barcode po.product.barcode
    json.product_name po.product.name
    json.product_value number_to_currency(po.product.value)
    json.product_url product_url(po.product, format: :json)
  end
end
