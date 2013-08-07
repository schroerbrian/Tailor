class VenuesController < ApplicationController
  include VenuesHelper

  def index
  end

  def search
    @param = params
    @title = params[:venue]
    @gender = params[:gender]

    @weather = wunderweather

    if @venue = Venue.find_by_name(@title)
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


