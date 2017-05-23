# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders, dependent: :destroy

  validates :barcode, :value, presence: true
  validates :barcode, uniqueness: true
end
