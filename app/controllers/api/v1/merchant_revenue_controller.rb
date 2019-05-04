class Api::V1::MerchantRevenueController < ApplicationController

  def index
    if params[:date]
      render json: MerchantRevenueSerializer.new(Invoice.single_merchant_revenue_by_date(params[:merchant_id], params[:date]))
    else
      render json: MerchantRevenueSerializer.new(Invoice.single_merchant_revenue(params[:merchant_id]))
    end
  end

end
