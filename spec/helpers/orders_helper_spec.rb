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
      expect(calculate_full_price(order)).to eq("R$ 3,00")
    end
  end

  describe "#calculate_itens()" do
    it "should calculate total amount of itens of given order" do
      client = Client.create!(name: 'Zé', cpf: '23948576210')
      product = Product.create!(name: 'Leite', barcode: '123', value: 2)
      order = Order.new(date: Date.today, client: client, discount: 25, status: Order::statuses[:open])
      order.product_orders.build(product: product, quantity: 2)
      order.product_orders.build(product: product, quantity: 2)
      order.save!
      expect(calculate_itens(order)).to eq(4)
    end
  end
end
