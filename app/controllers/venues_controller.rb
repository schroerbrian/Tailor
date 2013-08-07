class VenuesController < ApplicationController
  include VenuesHelper

  def index
    # @venues = Venue.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @venues }
    # end
    # renders venue found from search
    # includes tags annd items where gender is the param

  end

  def search
    @param = params
    @title = params[:venue]
    @gender = params[:gender]
    @venue = Venue.find_by_name(params[:venue])

    @weather = wunderweather

    if @venue  #check w ian
      render 'index'
    else
      redirect_to '/'
    end

  end

end

  # def show
  #   @venue = Venue.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @venue }
  #   end
  # end

  # def update
  #   @venue = Venue.find(params[:id])

  #   respond_to do |format|
  #     if @venue.update_attributes(params[:venue])
  #       format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @venue.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


