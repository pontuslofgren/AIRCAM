class Category < ApplicationRecord
  has_and_belongs_to_many :categories, through: :cameras_categories
end
