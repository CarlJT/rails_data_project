class TagsController < ApplicationController
  def index
    @tags = Tag.all.page params[:page]
  end

  def show
    @tag = Tag.find(params[:id])
    @media_in_tag = @tag.media_tags.page params[:page] 
  end
end
