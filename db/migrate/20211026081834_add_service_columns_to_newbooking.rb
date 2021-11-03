# frozen_string_literal: true

# migration to add service and price columns to newbookings table
class AddServiceColumnsToNewbooking < ActiveRecord::Migration[6.1]
  def change
    add_column :newbookings, :service_name, :string
    add_column :newbookings, :price, :float
  end
end
