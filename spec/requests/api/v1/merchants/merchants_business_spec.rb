require 'rails_helper'

describe 'Merchants API business intelligence' do
  it 'top merchants by revenue route succeeds' do

    get '/api/v1/merchants/most_revenue?quantity=2'

    expect(response).to be_successful
  end
end
