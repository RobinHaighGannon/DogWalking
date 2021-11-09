# frozen_string_literal: true

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  test 'Control' do
    service = Service.new
    service.name = 'test'
    service.price = 1.5
    assert service.save
  end
  test 'Service should not be saved empty' do
    service = Service.new
    assert_not service.save
  end
end
