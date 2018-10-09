class Medium < ApplicationRecord
    has_many :media_titles, dependent: :destroy
    has_many :media_pictures, dependent: :destroy
    has_many :episodes, dependent: :destroy
    has_many :media_tags, dependent: :destroy

    validates :id_anilist, numericality: {only_integer: true}
    validates :is_licensed, inclusion: {in: [true, false]}
    validates :is_adult, inclusion: {in: [true, false]}
    
    paginates_per 10
end
