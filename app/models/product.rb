class Product < ApplicationRecord
  validates :barcode, :value, presence: true
  validates :barcode, uniqueness: true
end
