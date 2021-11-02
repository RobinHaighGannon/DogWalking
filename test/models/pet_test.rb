# frozen_string_literal: false

require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test 'Control' do
    customers = Customer.all
    customer = customers[0]
    pet = customer.pets.new
    pet.name = 'Rover'
    pet.breed = 'Poodle'
    assert pet.save
  end
  test 'Pet should not be saved without a name' do
    customers = Customer.all
    customer = customers[0]
    pet = customer.pets.new
    assert_not pet.save
  end
  test 'Pet name should not contain a symbol' do
    customers = Customer.all
    customer = customers[0]
    pet = customer.pets.new
    pet.name = 'Ring@'
    assert_not pet.save
  end
  test 'Pet name should allow hyphens and spaces' do
    customers = Customer.all
    customer = customers[0]
    pet = customer.pets.new
    pet.name = 'Rover Haigh-Gannon'
    assert pet.save
  end
end
