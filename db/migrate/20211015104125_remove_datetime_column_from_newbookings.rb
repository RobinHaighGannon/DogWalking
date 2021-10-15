# frozen_string_literal: false

# Migration to remove the datetime column in newbookings table
class RemoveDatetimeColumnFromNewbookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :session, :datetime
  end
end
