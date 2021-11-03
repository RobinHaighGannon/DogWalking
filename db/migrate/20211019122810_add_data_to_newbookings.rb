# frozen_string_literal: true

# adding data to paid and complete columns
# rubocop:disable Metrics/MethodLength
class AddDataToNewbookings < ActiveRecord::Migration[6.1]
  # Temporary class to hold bookings data during this migration
  class Newbooking20211019122810 < ApplicationRecord
    self.table_name = 'newbookings'

    belongs_to :pet
    belongs_to :service
  end

  def change
    newbooking = Newbooking.all
    today = Date.today
    begin
      newbooking.each do |booking|
        # if the booking is in the past we will assume it has been completed and paid
        booking.complete = booking.date < today
        booking.paid = booking.date < today
        booking.save
      end
    rescue StandardError => e
      puts today
      raise e
    end
  end
end
# rubocop:enable Metrics/MethodLength
