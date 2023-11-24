class Availability < ApplicationRecord

  belongs_to :camera

  validates :start_date, start_date: true
  validates :start_date, :end_date, presence: true
end
