# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_170_522_175_124) do
  create_table 'clients', force: :cascade do |t|
    t.string 'name'
    t.string 'cpf'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'client_id'
    t.date 'date'
    t.integer 'discount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_orders_on_client_id'
  end

  create_table 'product_orders', force: :cascade do |t|
    t.integer 'product_id'
    t.integer 'order_id'
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_product_orders_on_order_id'
    t.index ['product_id'], name: 'index_product_orders_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'barcode'
    t.string 'name'
    t.float 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
