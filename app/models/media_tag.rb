class MediaTag < ApplicationRecord
  belongs_to :medium
  belongs_to :tag
  paginates_per 10
end
