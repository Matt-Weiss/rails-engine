require 'rails_helper'

describe "Customers API finders" do
  it "can search by id" do
    create_list(:customer, 3)
    expected_id = Customer.first.id

    get "/api/v1/customers/find?id=#{expected_id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["id"]).to eq(expected_id.to_s)
  end

  it "can search by first name" do
    create_list(:customer, 3)
    expected_first_name = Customer.first.first_name
    get "/api/v1/customers/find?first_name=#{expected_first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["attributes"]["first_name"]).to eq(expected_first_name)
  end

  it "can search by last name" do
    create_list(:customer, 3)
    expected_last_name = Customer.first.last_name
    get "/api/v1/customers/find?last_name=#{expected_last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["attributes"]["last_name"]).to eq(expected_last_name)
  end

  it "can find all by created_at" do
    Customer.create(first_name: "Joey",
                     last_name: "Ondricka",
                    created_at: "2012-03-27 14:54:05 UTC",
                    updated_at: "2012-03-27 14:54:05 UTC")
    Customer.create(first_name: "Cecilia",
                     last_name: "Osinski",
                    created_at: "2012-03-27 14:54:05 UTC",
                    updated_at: "2012-03-27 14:54:05 UTC")
    Customer.create(first_name: "Matt",
                     last_name: "Weiss",
                    created_at: "2012-03-27 14:54:05 UTC",
                    updated_at: "2012-03-27 14:54:05 UTC")
    get "/api/v1/customers/find_all?created_at=2012-03-27 14:54:05 UTC"

    merchant = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(merchant.count).to eq(3)
  end



end
