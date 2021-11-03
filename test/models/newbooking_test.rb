# frozen_string_literal: false

require 'test_helper'

class NewbookingTest < ActiveSupport::TestCase
  test 'Control' do
    pet = Pet.all[0]
    booking = create_test_booking(pet)
    assert booking.save
  end
  test 'Booking should not be saved without date' do
    pet = Pet.all[0]
    booking = create_test_booking(pet)
    booking.date = nil
    assert_not booking.save
  end
  test 'Booking should not be saved without time' do
    pet = Pet.all[0]
    booking = create_test_booking(pet)
    booking.time = nil
    assert_not booking.save
  end
  test 'Booking should not be saved without service' do
    pet = Pet.all[0]
    booking = create_test_booking(pet)
    booking.service = nil
    assert_not booking.save
  end
  def create_test_booking(pet)
    booking = Newbooking.new
    booking.pet = pet
    booking.time = Time.now
    booking.date = Date.today
    booking.service = Service.all[0]
    booking
  end
end
