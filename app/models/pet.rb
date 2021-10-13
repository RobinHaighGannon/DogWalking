# frozen_string_literal: false

# this class represents the pets that belong to the customers.
class Pet < ActiveRecord::Base
  belongs_to :customer
  has_many :newbookings, dependent: :destroy
<<<<<<< HEAD
  validates :name, presence: :true,
=======
  validates :name, presence: true,
>>>>>>> main
                   length: { minimum: 2 }
end
