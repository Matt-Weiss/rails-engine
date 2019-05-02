class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items

  def self.revenue_by_day(date)
    start_time = date.to_datetime.beginning_of_day
    end_time = date.to_datetime.end_of_day
    # binding.pry
  select("SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items, :transactions)
    .where(transactions: {result: "success"})
    .where(created_at: [start_time..end_time])
  end
end
