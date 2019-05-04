class Api::V1::Items::MostItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.most_items(search_params[:quantity]))
  end


  private

  def search_params
    params.permit(:quantity)
  end
end
