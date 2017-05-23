# frozen_string_literal: true

class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
end
