require 'rails_helper'

describe "transactions API" do
  it "sends a list of transactions" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant: merchant, customer: customer)
    create_list(:transaction, 3, invoice: invoice)

    get '/api/v1/transactions'

    expect(response).to be_successful
    transactions = JSON.parse(response.body)["data"]

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction by its id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant: merchant, customer: customer)
    id = create(:transaction, invoice: invoice).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(transaction["id"]).to eq(id.to_s)
  end
end
