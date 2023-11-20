class Booking < ApplicationRecord
  belongs_to :camera
  belongs_to :renter, class_name: 'User'
  has_many :reviews
end
