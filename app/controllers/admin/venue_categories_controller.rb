class Admin::VenueCategoriesController < Admin::BaseController
  def index
    @venue_categories = VenueCategory.all
  end

  def new; end

end