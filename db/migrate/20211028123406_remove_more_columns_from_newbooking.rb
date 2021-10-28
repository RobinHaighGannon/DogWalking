# frozen_string_literal: true

class RemoveMoreColumnsFromNewbooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :newbookings, :service
  end
end
