# frozen_string_literal: true

# adding paid and complete columns to bookings table to allow for more accurate stats
class AddColumnsToNewbooking < ActiveRecord::Migration[6.1]
  def change
    add_column :newbookings, :paid, :boolean
    add_column :newbookings, :complete, :boolean
  end
end
