# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_028_123_809) do
  create_table 'customers', force: :cascade do |t|
    t.string 'name'
    t.string 'phone'
    t.string 'email'
    t.text 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'postcode'
  end

  create_table 'newbookings', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'pet_id'
    t.integer 'service_id'
    t.date 'date'
    t.time 'time'
    t.boolean 'paid'
    t.boolean 'complete'
    t.string 'service_name'
    t.float 'price'
  end

  create_table 'pets', force: :cascade do |t|
    t.string 'name'
    t.string 'breed'
    t.integer 'customer_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_pets_on_customer_id'
  end

  create_table 'services', force: :cascade do |t|
    t.string 'name'
    t.float 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'newbookings', 'pets'
  add_foreign_key 'newbookings', 'services'
  add_foreign_key 'pets', 'customers'
end
