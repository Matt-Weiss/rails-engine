class Api::V1::BossModeController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.boss_mode(params[:merchant_id]))
  end
end
