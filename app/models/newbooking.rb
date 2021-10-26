# frozen_string_literal: false

# This class represents the bookings that the customers make for their pets to be walked.
class Newbooking < ActiveRecord::Base
  belongs_to :pet
  belongs_to :service

  def payment_due?
    complete? & !paid?
  end

  def settled?
    complete? & paid?
  end
end
