class VenuesController < ApplicationController
  def index; end

  def show
    @venue = Venue.new(params[:venue])
    @results ||= GiltGenerator.venue_suggestions(@venue.categories)
    @items = sort_items(@results, params)
  end

  private

  def sort_items(results, params)
    return GiltGenerator.sort_shoes(results) if params[:shoes] && !results.nil?
    return GiltGenerator.sort_accessories(results) if params[:accessories] && !results.nil?
    return GiltGenerator.sort_apparel(results) if !results.nil?
  end
end