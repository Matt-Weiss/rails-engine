class Api::V1::Relationships::ItemMerchantController < ApplicationController

  def show
    render json: MerchantSerializer.new(Item.find(params[:item_id]).merchant)
  end
end
