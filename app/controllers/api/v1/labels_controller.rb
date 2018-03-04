class Api::V1::LabelsController < Api::V1::ApplicationController
  def index
    render status: 200, json: Label.all
  end

  def show
    label = Label.find_by(name: params[:name])
    render status: 200, json: label
  end

end