class VenuesController < ApplicationController
  include VenuesHelper

  def index
  end

  def search

    @title = params[:venue]
    @gender = params[:gender]

    if @gender == 'm'
      @category = ['Tops','Bottoms', 'Belts', 'Shoes']
    else
      @category = ['Tops','Bottoms', 'Dresses', 'Handbags', 'Bracelets', 'Belts', 'Scarves', 'Legwear', 'Sandals', 'Necklaces', 'Shoes']
    end

    @weather = wunderweather

    if @venue = Venue.find_by_name(@title) #check w ian
      render 'index'
    else
      redirect_to '/'
    end

  end

end
