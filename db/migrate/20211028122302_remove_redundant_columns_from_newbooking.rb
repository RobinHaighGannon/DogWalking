# frozen_string_literal: true

class RemoveRedundantColumnsFromNewbooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :pet
    remove_column :newbookings, :pets
  end
end
