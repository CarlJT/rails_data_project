class Episode < ApplicationRecord
  belongs_to :medium
  validates :title, :thumbnail, :url, presence: true
end
