# frozen_string_literal: true

# The migration used to add a reference to services in the newbookings table
class AddServicesColumnToNewbookings < ActiveRecord::Migration[6.1]
  # Temporary class to hold service data
  class Service20211012145201 < ActiveRecord::Base
    self.table_name = 'services'
    has_many :newbookings, class_name: 'newbooking', foreign_key: 'newbooking_id'
  end

  def change
    add_column :newbookings, :service_id, :integer
    service = Service20211012145201.new
    newbooking = Newbooking.all
    service.name = 'walk'
    service.price = 0.0
    newbooking.each do |booking|
      booking.service_id = service.id
    end
    add_foreign_key :newbookings, :services
  end
end
