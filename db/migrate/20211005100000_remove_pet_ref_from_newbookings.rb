# frozen_string_literal: false

# the migration used to remove the pets column from the newbookings table
class RemovePetRefFromNewbookings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :newbookings, :pet, null: false, foreign_key: true
  end
end
