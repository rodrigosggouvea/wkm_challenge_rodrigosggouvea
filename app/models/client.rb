# frozen_string_literal: true

class Client < ApplicationRecord
  validates :name, :cpf, presence: true
  validates :cpf, uniqueness: true
end
