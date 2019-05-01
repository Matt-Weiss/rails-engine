require 'rails_helper'

describe "invoices API" do
  it "sends a list of invoices" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 3, merchant: merchant, customer: customer)

    get '/api/v1/invoices'

    expect(response).to be_successful
    invoices = JSON.parse(response.body)["data"]

    expect(invoices.count).to eq(3)
  end

  it "can get one invoice by its id" do
    merchant = create(:merchant)
    customer = create(:customer)
    id = create(:invoice, merchant: merchant, customer: customer).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoice["id"]).to eq(id.to_s)
  end
end
