class RemovePetsIdFromNewbookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :pets_id, :integer
  end
end
