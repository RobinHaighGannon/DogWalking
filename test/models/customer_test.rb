# frozen_string_literal: false

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
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
end
