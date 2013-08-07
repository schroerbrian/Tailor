class HomeController < ApplicationController

  def index
    @venues = Venue.all

    @venue_names = []

    @venues.each do |venue|
      @venue_names << venue.name
    end

  end

  def team
  end

end