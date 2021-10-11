# the migration used to update the pet ID in one of the bookings in the newbookings table
class ChangeDataInNewbookings < ActiveRecord::Migration[6.1]
  def change
    execute 'update newbookings set pet_id=1 where pet_id=5'
  end
end
