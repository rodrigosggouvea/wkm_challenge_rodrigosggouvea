# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :client
  has_many :product_orders, dependent: :destroy

  accepts_nested_attributes_for :product_orders, reject_if: :all_blank, allow_destroy: true

  validates :date, presence: true
end
