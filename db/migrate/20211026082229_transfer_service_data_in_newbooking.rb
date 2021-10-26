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
    newbooking = Newbooking20211026082229.all.includes(:pet, :service)
    begin
      newbooking.each do |booking|
        booking.service_name = booking.service.name
        booking.price = booking.service.price
        booking.save
      end
    rescue StandardError => e
      puts booking.service.name
      raise e
    end
  end
end
# rubocop:enable Metrics/MethodLength
