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

    @venue = Venue.find_by_name(@title)

    @weather = wunderweather

    venue_tag_ids = @venue.tags.map { |t| t.id }
      @item_search = []
      Item.all.each { |item| item_tag_ids = item.tags.map { |i| i.id }
        @item_search << item if ((venue_tag_ids & item_tag_ids).count > 0) }
    
    @item_search.select! { |item| 
      item.gender == @gender 
    }

    if @venue
      render 'index'
    else
      redirect_to '/'
    end

  end



end
