class AddDatetimeToNewbooking < ActiveRecord::Migration[6.1]
  def change
    add_column :newbookings, :session, :datetime
  end
end
