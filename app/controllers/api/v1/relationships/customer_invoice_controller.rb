class Api::V1::Relationships::CustomerInvoiceController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Invoice.where(customer_id: search_params[:customer_id]))
  end

  private
  def search_params
    params.permit(:customer_id)
  end
end
