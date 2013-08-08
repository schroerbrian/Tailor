class VenuesController < ApplicationController
  include VenuesHelper

  def index
  end

  def search

    @title = params[:venue]
    @gender = params[:gender]
    @clothing_category = ['Tops','Bottoms', 'Jackets and Coats', 'Suits', 'Dresses', 'Jumpsuits and Rompers'].sample #need to add more, also with logic that contains gender
    @shoes_category = []
    @accessories_category = []

    @weather = wunderweather

    if @venue = Venue.find_by_name(@title) #check w ian
      render 'index'
    else
      redirect_to '/'
    end

  end

end
