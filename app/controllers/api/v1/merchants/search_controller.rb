class Api::V1::Merchants::SearchController < ApplicationController

  def index
    render json: SearchSerializer.new(Merchant.where(search_params))
  end

  def show
    render json: SearchSerializer.new(Merchant.find_by(search_params))
  end

  private

  def search_params
    attributes = ["name", "id", "created_at", "updated_at"]
    attributes.each do |attribute|
      if params.keys.include?(attribute)
        return search_params = {attribute => params[attribute]}
      end
    end
  end
end
