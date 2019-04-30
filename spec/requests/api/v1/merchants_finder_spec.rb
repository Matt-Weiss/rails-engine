require 'rails_helper'
require 'pry'

describe "Merchants API finders" do
  it "can search by name" do
    create_list(:merchant, 3)

    get '/api/v1/merchants/find?name=MerchantName1'
    # binding.pry

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq('MerchantName1')

  end

  it "can search by id" do
    create_list(:merchant, 3)
    expected_id = Merchant.first.id

    get "/api/v1/merchants/find?id=#{expected_id}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(expected_id.to_s)
  end

  it "can search by created_at" do
    create_list(:merchant, 3)
    expected_creation = Merchant.first.created_at
    # binding.pry

    get "/api/v1/merchants/find?created_at=#{expected_creation}"

    merchant = JSON.parse(response.body)
    # binding.pry
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["created_at"]).to eq(expected_creation.as_json)
  end

  #created_at and #updated_at should be identical to the id test

  it "can find all by name" do
    create_list(:merchant, 3)
    expected_name = Merchant.first.name
    get "/api/v1/merchants/find_all?name=#{expected_name}"

    merchant = JSON.parse(response.body)["data"][0]
    #even though we returned only one element it was in array format, indicating this should work

    expect(response).to be_successful
    expect(merchant["attributes"]["name"]).to eq("#{expected_name}")
  end
end
