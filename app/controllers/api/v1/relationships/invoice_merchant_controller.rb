class Api::V1::Relationships::InvoiceMerchantController < ApplicationController

  def index
    render json: MerchantSerializer.new(Invoice.find(params[:invoice_id]).merchant)
  end
end
