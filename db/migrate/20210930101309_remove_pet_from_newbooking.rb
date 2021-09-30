class RemovePetFromNewbooking < ActiveRecord::Migration[6.1]
  def change
    remove_reference :newbookings, :pet, null: false, foreign_key: true
  end
end
