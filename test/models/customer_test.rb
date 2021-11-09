# frozen_string_literal: false

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test 'Control' do
    customer = create_test_customer
    assert customer.save
  end
  test 'Customer should not be saved empty' do
    customer = Customer.new
    assert_not customer.save
  end
  test 'Customer name should not contain a symbol' do
    customer = create_test_customer(name: 'R@£$')
    assert_not customer.save
  end
  test 'Customer name should allow hyphens and spaces' do
    customer = create_test_customer(name: 'Robin Haigh-Gannon')
    assert customer.save
  end
  test 'Customer phone number should not contain letters' do
    customer = create_test_customer(phone: '0823746T673Y')
    assert_not customer.save
  end
  def create_test_customer(name: 'Test', phone: '54783', email: 'test@gmail.com', address: '3 Eg Rd', postcode: 'HG6R4')
    Customer.new(name: name, phone: phone, email: email, address: address, postcode: postcode)
  end
end
