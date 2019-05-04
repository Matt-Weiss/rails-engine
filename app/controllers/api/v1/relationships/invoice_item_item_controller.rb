class Api::V1::Relationships::InvoiceItemItemController < ApplicationController

  def show
    render json: ItemSerializer.new(InvoiceItem.find(params[:invoice_item_id]).item)
  end
end
