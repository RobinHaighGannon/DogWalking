# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    @newbooking = Newbooking.all
    @totalbookings = @newbooking.size
    @paidcomplete = Newbooking.where(paid: true, complete: true)
    @paidincomplete = Newbooking.where(paid: true, complete: false)
    @unpaidcomplete = Newbooking.where(paid: false, complete: true)
    @unpaidincomplete = Newbooking.where(paid: false, complete: false)
  end
end
