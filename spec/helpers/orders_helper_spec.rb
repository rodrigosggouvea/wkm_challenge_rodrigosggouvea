# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersHelper, type: :helper do
  describe '#calculate_full_price()' do
    it "should calculate given order's full price with discount" do
      client = Client.create!(name: 'Zé', cpf: '23948576210')
      product = Product.create!(name: 'Leite', barcode: '123', value: 2)
      order = Order.new(date: Date.today, client: client, discount: 25, status: Order::statuses[:open])
      order.product_orders.build(product: product, quantity: 2)
      order.save!
      expect(calculate_full_price(order)).to eq(3.0)
    end
  end
end
