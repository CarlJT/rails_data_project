class MediaPicture < ApplicationRecord
  belongs_to :medium
  validates :size, :description, :link, presence: true
end
