class Api::V1::Relationships::CustomerTransactionController < ApplicationController
  def index
    render json: TransactionSerializer.new(Customer.find(params[:customer_id]).transactions)
  end

  private
  def search_params
    params.permit(:customer_id)
  end
end
