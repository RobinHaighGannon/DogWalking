# frozen_string_literal: false

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test 'Control' do
    customer = Customer.new
    customer.name = 'Linda Smith'
    customer.phone = '07594548796'
    customer.email = 'lindasmith@gmail.com'
    customer.address = '3 Lindow Road'
    customer.postcode = 'SK93ME'
    assert customer.save
  end
  test 'Customer should not be saved empty' do
    customer = Customer.new
    assert_not customer.save
  end
  test 'Customer name should not contain a symbol' do
    customer = Customer.new
    customer.name = 'R@£$'
    assert_not customer.save
  end
  test 'Customer name should allow hyphens and spaces' do
    customer = Customer.new
    customer.name = 'Robin Haigh-Gannon'
    assert customer.save
  end
  test 'Customer phone number should not contain letters' do
    customer = Customer.new
    customer.name = 'Test'
    customer.phone = '0823746T673Y'
    assert_not customer.save
  end
end
