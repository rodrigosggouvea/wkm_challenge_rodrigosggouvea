# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :orders

  validates :name, :cpf, presence: true
  validates :cpf, uniqueness: true
end
