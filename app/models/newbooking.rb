class Newbooking < ActiveRecord::Base
  belongs_to :pet
  belongs_to :service
end
