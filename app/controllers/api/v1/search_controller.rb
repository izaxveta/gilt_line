class Api::V1::SearchController < Api::V1::ApplicationController
  def index
    venues = Venue.search_venues(params[:q])
    render status: 200, json: venues
  end
end