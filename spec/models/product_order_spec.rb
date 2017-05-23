# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  describe 'Relationships' do
    it { should belong_to(:product) }
    it { should belong_to(:order) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:quantity) }
  end
end
