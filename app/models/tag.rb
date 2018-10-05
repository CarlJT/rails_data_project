class Tag < ApplicationRecord
    has_many :media_tags, dependent: :destroy
end
