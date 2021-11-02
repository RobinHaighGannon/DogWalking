# frozen_string_literal: true

class Service < ActiveRecord::Base
  has_many :newbookings, class_name: 'newbooking', foreign_key: 'newbooking_id'
  validates :name, presence: true
  validates :price, presence: true
end
