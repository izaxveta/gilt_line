class Api::V1::VenueCategoriesController < Api::V1::ApplicationController
  def index
    render status: 200, json: VenueCategory.all
  end

end