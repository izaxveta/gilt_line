class Admin::VenueCategoriesController < Admin::BaseController
  def index
    @venue_categories = VenueCategory.all
  end

end