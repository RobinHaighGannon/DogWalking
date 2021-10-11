# the migration used to remove the pet ID column from the newbookings table
class RemovePetIdFromNewbookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :pet_id, :integer
  end
end
