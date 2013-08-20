class VenuesController < ApplicationController
  include VenuesHelper

  def index
  end

  def search

    # initial search and show
    @title = params[:venue]
    @gender = params[:gender]

    if @gender == 'm'
      @category = male_cat
    else
      @category = female_cat
    end

    # find venue
    @venue = Venue.find_by_name(@title)

    if @venue
      # calling wunderweather
      @weather = wunderweather

      # find all the items associated with the venue
      venue_tag_ids = @venue.tags.map { |t| t.id }

      @item_search = []

      Item.all.each { |item| item_tag_ids = item.tags.map { |i| i.id }
      @item_search << item if ((venue_tag_ids & item_tag_ids).count > 0) }

      @item_search.select! { |item|
        item.gender == @gender
      }

      categories = []
      @names = []
      @item_search.each  {|item| categories << item.categories }
      categories.each { |category| @names << category[0].name }
      @names.uniq!

      render 'index'

    else
      redirect_to '/'
    end

  end

end
