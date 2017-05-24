# frozen_string_literal: true

class Order < ApplicationRecord
  include Calculable

  belongs_to :client
  has_many :product_orders, dependent: :destroy

  enum status: %i[open paid cancelled]
  accepts_nested_attributes_for :product_orders, reject_if: :all_blank, allow_destroy: true

  validates :date, :status, presence: true
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, allow_nil: true }
end
