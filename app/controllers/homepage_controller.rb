# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    @newbooking = Newbooking.all
    @totalmoney = 0
    @totalbookings = 0
    @newbooking.each do |newbooking|
      @totalmoney += newbooking.service.price
      @totalbookings += 1
    end
  end
end
