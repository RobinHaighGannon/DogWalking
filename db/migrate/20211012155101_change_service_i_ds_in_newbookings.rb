# frozen_string_literal: true

# The migration used to change the service IDs in the newbookings table
class ChangeServiceIDsInNewbookings < ActiveRecord::Migration[6.1]
  def change
    execute 'update newbookings set service_id=2'
  end
end
