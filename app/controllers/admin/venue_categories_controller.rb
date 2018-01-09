class Admin::VenueCategoriesController < Admin::BaseController
  before_action :set_venue_category, only: [:show, :edit, :update]

  def index
    @venue_categories = VenueCategory.all
  end

  def show; end

  def new; end

  def create
    categories = JSON.parse(params[:generator_form])
    VenueCategory.generate_venue_categories(categories)
    redirect_to venue_categories_path
  end

  def edit; end

  def update
    if venue_category.update(venue_category_params)
      flash[:success] = "#{venue_category.name} update successful"
      redirect_to venue_category_path(id: venue_category.id)
    else
      flash[:success] = "Something went wrong"
      render :edit
    end
  end

  private
    attr_reader :venue_category

    def set_venue_category
      @venue_category = VenueCategory.find(params[:id])
    end

    def venue_category_params
      params.require(:venue_category).permit(:name)
    end
end