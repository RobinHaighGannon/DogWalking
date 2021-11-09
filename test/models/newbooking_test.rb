# frozen_string_literal: false

require 'test_helper'

class NewbookingTest < ActiveSupport::TestCase
  test 'Control' do
    booking = create_test_booking
    assert booking.save
  end
  test 'Booking should not be saved without date' do
    booking = create_test_booking(date: nil)
    assert_not booking.save
  end
  test 'Booking should not be saved without time' do
    booking = create_test_booking(time: nil)
    assert_not booking.save
  end
  test 'Booking should not be saved without service' do
    booking = create_test_booking(service: nil)
    assert_not booking.save
  end
  def create_test_booking(pet: Pet.all[0], time: Time.now, date: Date.today, service: Service.all[0])
    Newbooking.new(pet: pet, time: time, date: date, service: service)
  end
end
