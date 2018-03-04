class Api::V1::VenueCategoriesController < Api::V1::ApplicationController
  def index
    render status: 200, json: VenueCategory.all
  end

  def show
    venue_category = VenueCategory.find_by(name: params[:name].capitalize)
    render status: 200, json: {
      venue_category: venue_category,
      labels: venue_category.labels
    }
  end
end