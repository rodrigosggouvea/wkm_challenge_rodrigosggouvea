# frozen_string_literal: true

class Order < ApplicationRecord
  include Calculable

  belongs_to :client
  has_many :product_orders, dependent: :destroy

  enum status: %i[open paid cancelled]
  accepts_nested_attributes_for :product_orders, reject_if: :all_blank, allow_destroy: true

  validates :date, :status, presence: true
end
