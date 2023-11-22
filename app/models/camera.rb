class Camera < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :categories, through: :cameras_categories
  has_many :availabilities
  has_many :bookings

  has_many_attached :photos

  validates :title, :description, :brand, :price, :location, presence: true
end
