# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength

# Migration to preserve the data in newbookings
class TransferServiceDataInNewbooking < ActiveRecord::Migration[6.1]
  # Temporary class to hold newbookings data
  class Newbooking20211026082229 < ApplicationRecord
    self.table_name = 'newbookings'

    belongs_to :pet
    belongs_to :service
  end

  def change
    newbooking = Newbooking20211026082229.all.includes(:service)
    reversible do |dir|
      dir.up do
        newbooking.each do |booking|
          service = booking.service
          booking.update(service_name: service.name, price: service.price)
        rescue StandardError => e
          puts service.name
          raise e
        end
      end

      dir.down do
        newbooking.each do |booking|
          booking.update(service_name: nil, price: nil)
        end
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength
