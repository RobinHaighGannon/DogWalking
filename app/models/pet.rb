# frozen_string_literal: false

# this class represents the pets that belong to the customers.
class Pet < ActiveRecord::Base
  belongs_to :customer
  has_many :newbookings, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2 }
  validates_format_of :name, with: /\A\p{L}+(?:[-\s]\p{L}+)*\z/,
                             message: 'must only contain letters, spaces and hyphens'
  validates_format_of :breed, with: /\A\p{L}*(?:[-\s]\p{L}+)*\z/,
                              message: 'must only contain letters, spaces and hyphens'
end
