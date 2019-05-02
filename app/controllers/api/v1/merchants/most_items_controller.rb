class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    # binding.pry
    render json: MerchantSerializer.new(Merchant.most_items(search_params[:quantity]))
  end


  private

  def search_params
    params.permit(:quantity)
  end
end
