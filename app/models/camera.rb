class Camera < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :categories, through: :cameras_categories
  has_many :availabilities
  has_many :bookings

  has_many_attached :photos

  validates :title, :description, :brand, :price, :location, presence: true

  private

  # this is used to block dates in the calendar view
  # checks the date ranges of all bookings, stores in an array
  # check the date ranges of all blocked by the renter, stores in an array
  # joins the arrays. We now have an array of hashes that can be used by flatpickr
  # https://flatpickr.js.org/examples/#disabling-dates

  def blocked_dates
    book_dates = bookings.map do |booking|
      {
        from: booking.from_date,
        to: booking.to_date
      }
    end

    unavailable_dates = availabilities.map do |block|
      {
        from: block.from_date,
        to: block.to_date
      }

      book_dates + unavailable_dates
    end
  end

end
