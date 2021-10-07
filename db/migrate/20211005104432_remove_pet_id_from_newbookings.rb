class RemovePetIdFromNewbookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :pet_id, :integer
  end
end
