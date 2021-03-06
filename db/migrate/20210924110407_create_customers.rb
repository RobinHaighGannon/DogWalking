# frozen_string_literal: false

# the migration used to create the customers table
class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
