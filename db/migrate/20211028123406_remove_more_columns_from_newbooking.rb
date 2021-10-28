# frozen_string_literal: true

# removing some columns from newbookings that were causing an error
class RemoveMoreColumnsFromNewbooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :service
  end
end
