# the migration used to add a customers column to the newbookings table
class AddCustomerToNewbookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :newbookings, :customer, null: false, foreign_key: true
  end
end
