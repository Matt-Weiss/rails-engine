require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'relationships' do
    it {should belong_to :customer}
    it {should belong_to :merchant}
    it {should have_many :transactions}
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

    it 'revenue_by_day' do
      results = Invoice.revenue_by_day(@invoice_1.created_at)
      expect(results.total_revenue).to eq(1400)
      #sums all invoices for a single day. the @invoice_1.date in the argument
      #is for convenience, don't get confused.
    end

    it 'single_merchant_revenue' do
      results = Invoice.single_merchant_revenue(@merchant_1.id)
      expect(results.total_revenue).to eq(500)
    end

    it 'single_merchant_revenue_by_date' do
      results = Invoice.single_merchant_revenue_by_date(@merchant_1.id, @invoice_1.created_at)
      expect(results.total_revenue).to eq(500)
    end
  end
end
