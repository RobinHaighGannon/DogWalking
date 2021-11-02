# frozen_string_literal: false

require 'test_helper'

class NewbookingTest < ActiveSupport::TestCase
  test 'Control' do
    pet = Pet.all[0]
    booking = Newbooking.new
    booking.pet = pet
    booking.date = Date.today
    booking.time = Time.now
    booking.service = Service.all[0]
    assert booking.save
  end
  test 'Booking should not be saved without date' do
    pet = Pet.all[0]
    booking = Newbooking.new
    booking.pet = pet
    booking.time = Time.now
    booking.service = Service.all[0]
    assert_not booking.save
  end
  test 'Booking should not be saved without time' do
    pet = Pet.all[0]
    booking = Newbooking.new
    booking.pet = pet
    booking.date = Date.today
    booking.service = Service.all[0]
    assert_not booking.save
  end
  test 'Booking should not be saved without service' do
    pet = Pet.all[0]
    booking = Newbooking.new
    booking.pet = pet
    booking.time = Time.now
    booking.date = Date.today
    assert_not booking.save
  end
end
