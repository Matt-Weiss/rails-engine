class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.where(search_params))
  end

  def show
    render json: ItemSerializer.new(Item.find_by(search_params))
  end

  private

  def search_params
    updated_params = params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
    if params[:unit_price]
      updated_params[:unit_price] = (updated_params[:unit_price].delete(".")).to_i
    end
    updated_params
  end
end
