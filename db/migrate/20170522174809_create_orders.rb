# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :client, foreign_key: true
      t.date :date
      t.integer :discount

      t.timestamps
    end
  end
end
