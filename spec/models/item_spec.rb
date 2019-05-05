require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
  end

  describe 'class methods' do
    before(:each) do
      @merchant_1 = create(:merchant, name: "Schroeder-Jerde")
      @merchant_2 = create(:merchant, name: "Klein, Rempel and Jones")
      @merchant_3 = create(:merchant, name: "Willms and Sons")
      @customer = create(:customer)
      @item_1 = create(:item, merchant: @merchant_1)
      @item_2 = create(:item, merchant: @merchant_2)
      @item_3 = create(:item, merchant: @merchant_3)
      @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer)
      @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer)
      @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer)
      @invoice_item_1 = create(:invoice_item, invoice: @invoice_1, item: @item_1, quantity: 2, unit_price: 250)
      @invoice_item_2 = create(:invoice_item, invoice: @invoice_2, item: @item_2, quantity: 3, unit_price: 300)
      @transaction_1 = create(:transaction, invoice_id: @invoice_1.id, result: "success")
      @transaction_2 = create(:transaction, invoice_id: @invoice_2.id, result: "success")
    end

    it 'most_revenue' do
      results = Item.most_revenue(2)
      expect(results.length).to eq(2)
      expect(results[0].id).to eq(@item_2.id)
    end

    it 'most_items' do
      results = Item.most_items(2)
      expect(results.length).to eq(2)
      expect(results[0].id).to eq(@item_2.id)
    end

    it 'best_day' do
      results = Item.best_day(@item_1.id)
      expect(results.created_at.to_date).to eq(@item_1.created_at.to_date)
      #the results.created_at gets serialized later
    end
  end
end
