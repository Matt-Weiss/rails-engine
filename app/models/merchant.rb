class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(num_records)
    select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:transactions, :invoice_items])
      .where(transactions: {result: "success"})
      .group(:id)
      .order("revenue DESC")
      .limit(num_records)
  end

  def self.most_items(num_records)
    select("merchants.*, SUM(invoice_items.quantity) AS total_items")
      .joins(invoices: [:transactions, :invoice_items])
      .where(transactions: {result: "success"})
      .group(:id)
      .order("total_items DESC")
      .limit(num_records)
  end

  def self.favorite_merchant(customer)
    select("merchants.*, COUNT(invoices.customer_id) AS count_id")
    .joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .where("invoices.customer_id = #{customer}")
    .group(:id)
    .order("count_id DESC")
    .first
  end

end
