class MediaController < ApplicationController
  def index
    # By default, index view will only show current season's Media
    # See article for explanation: https://en.wikipedia.org/wiki/Japanese_television_drama

    # Get current datetime, and find out what the current season is
    current_year = Time.new.year 
    current_season = ''

    if Time.new.month  >= 10
      current_season = 'FALL'
    elsif Time.new.month >= 7
      current_season = 'SUMMER'
    elsif Time.new.month >= 4
      current_season = 'SPRING'
    else
      current_season ='WINTER'
    end

  end

  def show
  end
end
