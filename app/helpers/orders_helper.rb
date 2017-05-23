# frozen_string_literal: true

module OrdersHelper
  def calculate_full_price(order)
    total = 0
    order.product_orders.each do |po|
      total += (po.product.value * po.quantity)
    end
    if order.discount && order.discount > 0
      total *= (1 - (order.discount.to_f / 100))
    end
    total
  end
end
