# frozen_string_literal: true

# Migration to remove the service reference from the newbookings table
class RemoveServicesRefFromNewbooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :service, :reference
  end
end
