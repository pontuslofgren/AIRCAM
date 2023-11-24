class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cameras
  has_many :bookings
  has_many :reviews

  has_one_attached :photo

  def full_name
    [first_name, last_name].compact.join(" ")
  end
end
