# frozen_string_literal: false

# This class represents the customers of the dogwalking business and stores their information
class Customer < ActiveRecord::Base
  has_many :pets, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }
end
