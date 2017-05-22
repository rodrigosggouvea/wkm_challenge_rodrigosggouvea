# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :barcode
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
