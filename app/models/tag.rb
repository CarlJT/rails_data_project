class Tag < ApplicationRecord
    has_many :media_tags, dependent: :destroy
    validates :name, :category, presence: true
    paginates_per 30
end
