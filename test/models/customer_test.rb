# frozen_string_literal: false

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test 'Customer name' do
    customer = Customer.new
    assert_not customer.save
  end
end
