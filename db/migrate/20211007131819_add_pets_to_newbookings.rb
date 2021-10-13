# frozen_string_literal: false

# the migration used to add a pets column to the newbookings table
class AddPetsToNewbookings < ActiveRecord::Migration[6.1]
  def change
    add_column :newbookings, :pet_id, :integer
    execute 'update newbookings set pet_id=5'
    add_foreign_key :newbookings, :pets
  end
end
