# frozen_string_literal: false

# the migration used to add a session column to the newbookings table
class AddDatetimeToNewbooking < ActiveRecord::Migration[6.1]
  def change
    add_column :newbookings, :session, :datetime
  end
end
