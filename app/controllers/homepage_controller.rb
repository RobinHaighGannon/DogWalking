# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    newbooking = Newbooking.all.includes(:service, :pet)
    @totalbookings = newbooking.size
    @todaysbookings = newbooking.where(date: Date.today)
    hsh = Hash.new { |h, k| h[k] = 0 }
    calculate_money(hsh, newbooking)
    @money_totals = hsh
    return unless params[:pet_id]

    make_quick_booking
  end

  private

  def calculate_money(hsh, newbooking)
    newbooking.each_with_object(hsh) do |booking, h|
      h[:settled] += booking.service.price if booking.settled?
      h[:due] += booking.service.price if booking.payment_due?
      h[:incomplete] += booking.service.price unless booking.complete?
    end
  end

  def make_quick_booking
    pet = Pet.find(params[:pet_id])
    customer = pet.customer
    redirect_to new_customer_pet_newbooking_path(customer, pet)
  end
end
