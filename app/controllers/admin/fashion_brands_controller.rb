class Admin::FashionBrandsController < Admin::BaseController
  def index
    @fashion_brands = FashionBrand.all
  end

  def new
    @fashion_brand = FashionBrand.new
  end

  def create
    fashion_brand = FashionBrand.new(fashion_brand_params)
    if fashion_brand.save
      flash[:success] = "#{fashion_brand.name} registered."
      redirect_to fashion_brands_path
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  private

    def fashion_brand_params
      params.require(:fashion_brand).permit(:name)
    end

end