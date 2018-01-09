class Admin::LabelsController < Admin::BaseController
  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    label = Label.new(label_params)
    if label.save
      flash[:success] = "#{label.name} registered."
      redirect_to labels_path
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  private

    def label_params
      params.require(:label).permit(:name)
    end

end

