# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    @newbooking = Newbooking.all
    @totalbookings = @newbooking.size
    @totalmoney = @newbooking.reduce(0) { |sum, booking| sum + booking.service.price }
  end
end
