class PagesController < ApplicationController
    def about
        @media_count = Medium.count
        @media_title_count = MediaTitle.count
        @media_picture_count = MediaPicture.count
        @episode_count = Episode.count
        @tag_count = Tag.count
    end
end
