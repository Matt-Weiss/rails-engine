class Api::V1::MerchantFavoriteCustomerController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.favorite_customer(params[:merchant_id]))
  end

end
