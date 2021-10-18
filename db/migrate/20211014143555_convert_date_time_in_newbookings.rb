# frozen_string_literal: false

# Migration to convert the datetime column into a date and time column in newbookings table
class ConvertDateTimeInNewbookings < ActiveRecord::Migration[6.1]
  # Temporary class to hold newbooking data while converting
  class Newbooking20211014143555 < ApplicationRecord
    self.table_name = 'newbookings'

    belongs_to :pet
    belongs_to :service
  end

  def change
    newbooking = Newbooking20211014143555.all
    newbooking.each do |booking|
      date = booking.session.to_date
      time = booking.session.to_time
      booking.update!(date: date, time: time)
    rescue StandardError => e
      puts booking.session
      raise e
    end
  end
end
