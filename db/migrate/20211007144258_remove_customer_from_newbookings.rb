class RemoveCustomerFromNewbookings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :newbookings, :customer, null: false, foreign_key: true
  end
end
