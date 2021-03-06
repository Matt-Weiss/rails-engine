require 'rails_helper'
require 'pry'

describe "Merchants API finders" do
  it "can search by name" do
    create_list(:merchant, 3)
    expected_name = Merchant.first.name

    get "/api/v1/merchants/find?name=#{expected_name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq("#{expected_name}")

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
    merchant = Merchant.create(name: "Koepp, Waelchi and Donnelly",
                         created_at: "2012-03-27 14:54:05 UTC",
                         updated_at: "2012-03-27 14:54:05 UTC")

    get "/api/v1/merchants/find?created_at=2012-03-27 14:54:05 UTC"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq("Koepp, Waelchi and Donnelly")
  end


  it "can find all by name" do
    create_list(:merchant, 3)
    expected_name = Merchant.first.name
    get "/api/v1/merchants/find_all?name=#{expected_name}"

    merchant = JSON.parse(response.body)["data"][0]

    expect(response).to be_successful
    expect(merchant["attributes"]["name"]).to eq("#{expected_name}")
  end
end
