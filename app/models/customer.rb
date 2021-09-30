class Customer < ActiveRecord::Base 
    has_many :pets, dependent: :destroy
    has_many :newbookings, dependent: :destroy
    validates :name, presence: :true,
    length: {minimum: 2}
end
