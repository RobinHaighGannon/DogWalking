# frozen_string_literal: false

# contains all of the methods for the homepage
class HomepageController < ApplicationController
  def index
    @newbooking = Newbooking.all
    @totalbookings = @newbooking.size
    @totalmoney = @newbooking.reduce(0) { |sum, booking| sum + booking.service.price }
    return unless params[:pet_id]

    pet = Pet.find(params[:pet_id])
    customer = pet.customer
    make_quick_booking(pet, customer)
  end

  def make_quick_booking(pet, customer)
    redirect_to new_customer_pet_newbooking_path(customer, pet)
  end
end
