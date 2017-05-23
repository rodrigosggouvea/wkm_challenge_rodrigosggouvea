# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Relationships' do
    it { should belong_to(:client) }
    it { should have_many(:product_orders) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:date) }
  end
end
