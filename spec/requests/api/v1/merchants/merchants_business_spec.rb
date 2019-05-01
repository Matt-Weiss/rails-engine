require 'rails_helper'

describe 'Merchants API business intelligence' do
  it 'should return top merchants by revenue' do
    merchant_1 = Merchant.create(name: "Schroeder-Jerde")
    merchant_2 = Merchant.create(name: "Klein, Rempel and Jones")
    merchant_3 = Merchant.create(name: "Willms and Sons")

    get '/api/v1/merchants/most_revenue?quantity=2'
  end
end
