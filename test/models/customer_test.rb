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
    customer = create_test_customer
    customer.name = 'R@£$'
    assert_not customer.save
  end
  test 'Customer name should allow hyphens and spaces' do
    customer = create_test_customer
    customer.name = 'Robin Haigh-Gannon'
    assert customer.save
  end
  test 'Customer phone number should not contain letters' do
    customer = create_test_customer
    customer.phone = '0823746T673Y'
    assert_not customer.save
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
