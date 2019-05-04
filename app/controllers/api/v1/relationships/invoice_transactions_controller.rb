class Api::V1::Relationships::InvoiceTransactionsController < ApplicationController

  def index
    render json: TransactionSerializer.new(Invoice.find(params[:invoice_id]).transactions)
  end
end
