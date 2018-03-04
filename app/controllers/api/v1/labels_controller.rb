class Api::V1::LabelsController < Api::V1::ApplicationController
  def show
    label = Label.find_by(name: params[:name])
    render status: 200, json: label
  end

end