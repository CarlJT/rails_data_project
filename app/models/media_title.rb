class MediaTitle < ApplicationRecord
  belongs_to :medium
  validates :code, :title, presence: true
end
