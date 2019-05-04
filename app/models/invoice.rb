class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.revenue_by_day(date)
    start_time = date.to_datetime.beginning_of_day
    end_time = date.to_datetime.end_of_day

  select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items, :transactions)
    .where(transactions: {result: "success"})
    .where(created_at: [start_time..end_time])[0]
  end

  def self.single_merchant_revenue(merchant)
    select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(:invoice_items, :transactions)
      .where(transactions: {result: "success"})
      .where(merchant_id: merchant)[0]
  end

  def self.single_merchant_revenue_by_date(merchant, date)
    start_time = date.to_datetime.beginning_of_day
    end_time = date.to_datetime.end_of_day

    select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(:invoice_items, :transactions)
      .where(transactions: {result: "success"})
      .where(created_at: [start_time..end_time])
      .where(merchant_id: merchant)[0]
  end

end
