class AddCustomerToNewbookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :newbookings, :customer, null: false, foreign_key: true
  end
end
