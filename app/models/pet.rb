class Pet < ActiveRecord::Base
  belongs_to :customer
  validates :name, presence: :true,
    length: {minimum: 2}
end
