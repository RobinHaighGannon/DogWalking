# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    newbooking = Newbooking.all.includes(:service, :pet)
    @totalbookings = newbooking.size
    @todaysbookings = newbooking.where(date: Date.today)
    @money_totals = calculate_money(newbooking)
    return unless params[:pet_id]

    make_quick_booking
  end

  private

  def calculate_money(newbooking)
    newbooking.each_with_object(Hash.new { |h, k| h[k] = 0 }) do |booking, h|
      price = booking.price
      if booking.settled?
        h[:settled] += price
      elsif booking.payment_due?
        h[:due] += price
      else
        h[:incomplete] += price
      end
    end
  end

  def make_quick_booking
    pet = Pet.find(params[:pet_id])
    redirect_to new_customer_pet_newbooking_path(pet.customer, pet)
  end
end
