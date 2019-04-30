require 'rails_helper'
require 'pry'

describe "Merchants API finders" do
  it "can search by name" do
    create_list(:merchant, 3)

    get '/api/v1/merchants/find?name=MerchantName1'

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["name"]).to eq('MerchantName1')

  end

  it "can search by id" do
    create_list(:merchant, 3)
    expected_id = Merchant.first.id

    get "/api/v1/merchants/find?id=#{expected_id}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["id"]).to eq(expected_id)
  end

  #created_at and #updated_at should be identical to the id test

  it "can find all by name" do
    create_list(:merchant, 3)
    expected_name = Merchant.first.name
    get "/api/v1/merchants/find_all?name=#{expected_name}"

    merchant = JSON.parse(response.body)[0]
    #even though we returned only one element it was in array format, indicating this should work

    expect(response).to be_successful
    expect(merchant["name"]).to eq("#{expected_name}")
  end
end
