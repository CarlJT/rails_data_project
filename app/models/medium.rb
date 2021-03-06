class Medium < ApplicationRecord
    has_many :media_titles, dependent: :destroy
    has_many :media_pictures, dependent: :destroy

    validates :id_anilist, numericality: {only_integer: true}
    validates :is_licensed, inclusion: {in: [true, false]}
    validates :is_adult, inclusion: {in: [true, false]}
end
