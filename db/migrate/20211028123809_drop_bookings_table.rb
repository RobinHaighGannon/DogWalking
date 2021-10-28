# frozen_string_literal: true

class DropBookingsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :bookings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
