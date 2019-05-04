class Api::V1::ItemBestDayController < ApplicationController

  def index
    # binding.pry
    render json: BestDaySerializer.new(Item.best_day(params[:item_id]))
  end

end
