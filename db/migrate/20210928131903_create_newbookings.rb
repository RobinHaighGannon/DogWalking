# frozen_string_literal: false

# the migration used to create the newbookings table
class CreateNewbookings < ActiveRecord::Migration[6.1]
  def change
    create_table :newbookings do |t|
      t.string :date
      t.string :time
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
