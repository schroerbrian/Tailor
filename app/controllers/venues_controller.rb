class VenuesController < ApplicationController
  include VenuesHelper

  def index
  end

  def search
    @param = params
    @title = params[:venue]
    @gender = params[:gender]

    @weather = wunderweather

    if @venue = Venue.find_by_name(@title) #check w ian
      render 'index'
    else
      redirect_to '/'
    end

  end

end
