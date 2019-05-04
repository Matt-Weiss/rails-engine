class Api::V1::Relationships::InvoiceItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Invoice.find(params[:invoice_id]).items)
  end
end
