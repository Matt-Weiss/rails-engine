class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  # has_many :invoice_items, through: :invoices
  # has_many :transactions, through: :invoices

  def self.most_revenue(num_records)
    select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:transactions, :invoice_items])
      .where(transactions: {result: "success"})
      .group(:id)
      .order("revenue DESC")
      .limit(num_records)
  end
end
