class MediaController < ApplicationController
  def index
    @all_media = Medium.all.order(end_date: :desc).page params[:page]
  end

  def show
    @medium = Medium.find(params[:id])
    @titles = @medium.media_titles
    @media_tags = @medium.media_tags
    @media_pictures = @medium.media_pictures
    @episodes = @medium.episodes
  end
end
