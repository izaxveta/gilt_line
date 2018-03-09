class Api::V1::ItemsController < Api::V1::ApplicationController
  def index
    categories = params[:q].split(',')
    items = GiltGenerator.venue_suggestions(categories)
    render status: 200, json: {
      item_count: items.count,
      items: items
    }
  end
end