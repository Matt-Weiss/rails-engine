class Api::V1::Relationships::InvoiceCustomerController < ApplicationController

  def index
    render json: CustomerSerializer.new(Invoice.find(params[:invoice_id]).customer)
  end
end
