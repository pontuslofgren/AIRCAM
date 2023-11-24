class CameraCategory < ApplicationRecord
  belongs_to :categories
  belongs_to :camera
end
