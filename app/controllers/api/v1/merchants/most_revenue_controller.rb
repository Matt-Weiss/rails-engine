class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    # binding.pry
    render json: MerchantSerializer.new(Merchant.most_revenue(search_params[:quantity]))
  end


  private

  def search_params
    params.permit(:quantity)
  end
end
