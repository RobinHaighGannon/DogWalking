# frozen_string_literal: false

# this class represents the pets that belong to the customers.
class Pet < ActiveRecord::Base
  belongs_to :customer
  has_many :newbookings, dependent: :destroy
  validates :name, presence: :true,
                   length: { minimum: 2 }
end
