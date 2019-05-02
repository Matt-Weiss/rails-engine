class Api::V1::Relationships::InvoiceInvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(Invoice.find(params[:invoice_id]).invoice_items)
  end
end
