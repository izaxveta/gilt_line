class Admin::VenueCategoriesController < Admin::BaseController
  def index
    @venue_categories = VenueCategory.all
  end

  def new; end

  def create
    categories = JSON.parse(params[:generator_form])
    VenueCategory.generate_venue_categories(categories)
    redirect_to venue_categories_path
  end
end