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
    number_to_currency total
  end

  def calculate_itens(order)
    order.product_orders.pluck(:quantity).sum
  end

  def status_badge(order)
    color = case order.status
      when 'open' then 'blue'
      when 'paid' then 'green'
      when 'cancelled' then 'red'
      end
    content_tag(:span, class: "new badge #{color} left") do
      order.status
    end
  end
end
