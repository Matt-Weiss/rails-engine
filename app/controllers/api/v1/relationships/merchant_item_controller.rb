class Api::V1::Relationships::MerchantItemController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.where(merchant_id: search_params[:merchant_id]))
  end

  private

  def search_params
    params.permit(:merchant_id)
  end
end
