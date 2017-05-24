# frozen_string_literal: true

module OrdersHelper
  def status_badge(order)
    color = case order.status
      when 'open' then 'blue'
      when 'paid' then 'green'
      when 'cancelled' then 'red'
      end
    content_tag(:span, class: "new badge #{color} left") do
      order.status_i18n
    end
  end
end
