# This class represents the bookings that the customers make for their pets to be walked.
class Newbooking < ActiveRecord::Base
  belongs_to :pet
end
