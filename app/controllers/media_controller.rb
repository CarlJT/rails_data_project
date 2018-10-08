class MediaController < ApplicationController
  def index
    @all_media = Medium.all
  end

  def show
    @medium = Medium.find(params[:id])
    @titles = @medium.media_titles
    @media_tags = @medium.media_tags
    @media_pictures = @medium.media_pictures
    @episodes = @medium.episodes
  end
end
