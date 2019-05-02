class Api::V1::Merchants::RevenueByDayController < ApplicationController

  def index
    render json: RevenueByDaySerializer.new(Invoice.revenue_by_day(search_params[:date])[0])
  end


  private

  def search_params
    params.permit(:date)
  end
end
