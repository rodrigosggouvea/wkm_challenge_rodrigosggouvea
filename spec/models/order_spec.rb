# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Relationships' do
    it { should belong_to(:client) }
    it { should have_many(:product_orders) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:status) }
  end

  describe 'Concern methods' do
    describe '#full_price()' do
      it "should calculate given order's full price with discount" do
        client = Client.create!(name: 'Zé', cpf: '23948576210')
        product = Product.create!(name: 'Leite', barcode: '123', value: 2)
        order = Order.new(date: Date.today, client: client, discount: 25, status: Order::statuses[:open])
        order.product_orders.build(product: product, quantity: 2)
        order.save!
        expect(order.full_price).to eq(3)
      end
    end

    describe "#itens()" do
      it "should calculate total amount of itens of given order" do
        client = Client.create!(name: 'Zé', cpf: '23948576210')
        product = Product.create!(name: 'Leite', barcode: '123', value: 2)
        order = Order.new(date: Date.today, client: client, discount: 25, status: Order::statuses[:open])
        order.product_orders.build(product: product, quantity: 2)
        order.product_orders.build(product: product, quantity: 2)
        order.save!
        expect(order.itens).to eq(4)
      end
    end
  end
end
