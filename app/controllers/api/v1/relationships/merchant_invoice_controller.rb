class Api::V1::Relationships::MerchantInvoiceController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Invoice.where(merchant_id: search_params[:merchant_id]))
  end

  private
  def search_params
    params.permit(:merchant_id)
  end
end
