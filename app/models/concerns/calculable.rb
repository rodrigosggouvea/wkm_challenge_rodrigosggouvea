module Calculable
  extend ActiveSupport::Concern

  def full_price
    total = 0
    product_orders.each do |po|
      total += (po.product.value * po.quantity)
    end
    if discount && discount > 0
      total *= (1 - (discount.to_f / 100))
    end
    total
  end

  def itens
    product_orders.pluck(:quantity).sum
  end
end
