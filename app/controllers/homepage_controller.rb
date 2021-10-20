# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def index
    newbooking = Newbooking.all
    @totalbookings = newbooking.size
    hsh = Hash.new { |h, k| h[k] = 0 }
    newbooking.each_with_object(hsh) do |booking, h|
      h[:settled] += booking.service.price if booking.settled?
      h[:due] += booking.service.price if booking.payment_due?
      h[:incomplete] += booking.service.price unless booking.complete?
    end
    @settled = hsh[:settled]
    @due = hsh[:due]
    @incomplete = hsh[:incomplete]
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def calculate_total(array)
    array.reduce(0) do |sum, booking|
      sum + booking.service.price
    end
  end
end
