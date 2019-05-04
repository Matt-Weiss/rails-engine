class Api::V1::Relationships::InvoiceItemInvoiceController < ApplicationController

  def show
    render json: InvoiceSerializer.new(InvoiceItem.find(params[:invoice_item_id]).invoice)
  end
end
