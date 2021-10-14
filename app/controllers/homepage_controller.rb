# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    @newbooking = Newbooking.all
    @total = 0

    @newbooking.each do |newbooking| 
      @total += newbooking.service.price
    end
  end
end
