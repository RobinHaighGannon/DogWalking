# frozen_string_literal: false

# This class represents the customers of the dogwalking business and stores their information
class Customer < ActiveRecord::Base
  has_many :pets, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }

  validates_format_of :name, with: /\A\p{L}+(?:[-\s]\p{L}+)*\z/,
                             message: 'must only contain letters, spaces and hyphens'
  validates_format_of :phone, with: /\A[0-9]+\z/,
                              message: 'must only contain numbers'
end
