# frozen_string_literal: true

class Service < ActiveRecord::Base
  has_many :newbookings, class_name: 'newbooking', foreign_key: 'newbooking_id'
end
