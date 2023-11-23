class Camera < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :categories, through: :cameras_categories
  has_many :availabilities
  has_many :bookings

  has_many_attached :photos

  validates :title, :description, :brand, :price, :location, presence: true

  def blocked_dates
    book_dates = bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
      }
    end

    unavailable_dates = availabilities.map do |block|
      {
        from: block.start_date,
        to: block.end_date
      }
    end
      book_dates + unavailable_dates
  end

end
