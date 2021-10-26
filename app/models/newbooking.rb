# frozen_string_literal: false

# This class represents the bookings that the customers make for their pets to be walked.
class Newbooking < ActiveRecord::Base
  belongs_to :pet
  belongs_to :service

  scope :settled, -> { where(complete: true, paid: true) }
  scope :due, -> { where(complete: true, paid: false) }

  def payment_due?
    complete? & !paid?
  end

  def settled?
    complete? & paid?
  end
end
