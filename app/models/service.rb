class Service < ApplicationRecord
    has_many :newbookings, class_name: "newbooking", foreign_key: "newbooking_id"
end
