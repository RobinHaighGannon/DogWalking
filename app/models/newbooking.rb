class Newbooking < ApplicationRecord
  belongs_to :customer
  validates :date, presence: :true
end
