class Api::V1::LabelsController < Api::V1::ApplicationController
  def index
    render status: 200, json: Label.all
  end

  def show
    label = Label.find_by(name: params[:name])
    render status: 200, json: label
  end

  def create
    label = Label.new(label_params)
    if label.save
      render status: 201, json: {
        message: 'Label successfully created',
        label: label
      }
    else
      render status: 400, json: {
        message: 'Invalid request.'
      }
    end
  end

  private

    def label_params
      params.require(:label).permit(:name)
    end
end