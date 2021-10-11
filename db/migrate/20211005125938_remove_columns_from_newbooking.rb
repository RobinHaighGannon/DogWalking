# the migration used to remove the date and time columns from the newbookings table
class RemoveColumnsFromNewbooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :date, :string
    remove_column :newbookings, :time, :string
  end
end
