class Api::V1::CustomerFavoriteMerchantController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.favorite_merchant(params[:customer_id]))
  end

end
