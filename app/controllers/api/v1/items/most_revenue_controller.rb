class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.most_revenue(search_params[:quantity]))
  end


  private

  def search_params
    params.permit(:quantity)
  end
end
