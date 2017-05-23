# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Relationships' do
    it { should have_many(:product_orders) }
    it { should have_many(:orders).through(:product_orders) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:barcode) }
    it { should validate_presence_of(:value) }
    it { should validate_uniqueness_of(:barcode) }
  end
end
