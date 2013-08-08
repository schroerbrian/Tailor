class VenuesController < ApplicationController
  include VenuesHelper

  def index
  end

  def search

    venue_tag_ids = Venue.last.tags.map { |t| t.id }
      @item_search = []
      Item.all.each { |item| item_tag_ids = item.tags.map { |i| i.id }
        @item_search << item if ((venue_tag_ids & item_tag_ids).count > 0) }

    @title = params[:venue]
    @gender = params[:gender]
    @clothing_category = ['Tops','Bottoms', 'Jackets and Coats', 
    'Suits', 'Dresses', 'Jumpsuits and Rompers'].sample #need to add more, also with logic that contains gender
    @shoes_category = []
    @accessories_category = []

    @weather = wunderweather
    @venue = Venue.find_by_name(@title)

    if @venue 
      render 'index'
    else
      redirect_to '/'
    end

  end



end
