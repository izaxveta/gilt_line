class SearchController < ApplicationController
  def index
    @venues = Venue.search_venues(params[:q])
  end
end