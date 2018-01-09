class VenuesController < ApplicationController
  def index; end

  def show
    @venue = Venue.new(params[:venue])
  end
end