# frozen_string_literal: false

require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test 'Control' do
    customer = create_test_customer
    pet = customer.pets.new
    pet.name = 'Rover'
    pet.breed = 'Poodle'
    assert pet.save
  end
  test 'Pet should not be saved without a name' do
    customer = create_test_customer
    pet = customer.pets.new
    assert_not pet.save
  end
  test 'Pet name should not contain a symbol' do
    customer = create_test_customer
    pet = customer.pets.new
    pet.name = 'Ring@'
    assert_not pet.save
  end
  test 'Pet name should allow hyphens and spaces' do
    customer = create_test_customer
    pet = customer.pets.new
    pet.name = 'Rover Haigh-Gannon'
    assert pet.save
  end
  def create_test_customer
    customer = Customer.new
    customer.name = 'Test Data'
    customer.phone = '547839484'
    customer.email = 'testdata@gmail.com'
    customer.address = '3 Example Road'
    customer.postcode = 'HG6DFR4'
    customer
  end
end
