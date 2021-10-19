# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    @newbooking = Newbooking.all
    @totalbookings = @newbooking.size
    @paidcomplete = calculate_total(Newbooking.where(paid: true, complete: true))
    @paidincomplete = calculate_total(Newbooking.where(paid: true, complete: false))
    @unpaidcomplete = calculate_total(Newbooking.where(paid: false, complete: true))
    @unpaidincomplete = calculate_total(Newbooking.where(paid: false, complete: false))
  end

  private

  def calculate_total(array)
    array.reduce(0) do |sum, booking|
      sum + booking.service.price
    end
  end
end
