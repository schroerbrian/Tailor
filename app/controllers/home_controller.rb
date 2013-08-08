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

  def contact

  end

  def send_contact_email
    TeamMailer.contact_email(params[:name], params[:email], params[:content]).deliver
    flash[:success] = "Thanks for your comment. We'll contact you shortly."
    render :contact
  end
end