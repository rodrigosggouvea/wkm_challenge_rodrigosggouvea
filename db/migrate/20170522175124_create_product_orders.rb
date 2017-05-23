# frozen_string_literal: true

class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
