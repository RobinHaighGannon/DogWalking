# frozen_string_literal: true

# Migration to add date and time columns back into newbookings table
class AddDateAndTimeColumnsToNewbookings < ActiveRecord::Migration[6.1]
  add_column :newbookings, :date, :date
  add_column :newbookings, :time, :time
end
