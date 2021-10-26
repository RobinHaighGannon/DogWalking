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

ActiveRecord::Schema.define(version: 20_211_026_082_229) do
  create_table 'bookings', force: :cascade do |t|
    t.string 'date'
    t.string 'time'
    t.integer 'pet_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['pet_id'], name: 'index_bookings_on_pet_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'name'
    t.string 'phone'
    t.string 'email'
    t.text 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'postcode'
  end

  # Could not dump table "newbookings" because of following StandardError
  #   Unknown type '' for column 'pet'

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

  add_foreign_key 'bookings', 'pets'
  add_foreign_key 'newbookings', 'pets'
  add_foreign_key 'newbookings', 'services'
  add_foreign_key 'pets', 'customers'
end
