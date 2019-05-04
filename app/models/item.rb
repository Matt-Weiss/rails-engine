class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items

  default_scope -> {order(:id)}

  def self.most_revenue(num_records)
    unscoped.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").joins(invoice_items: [invoice: :transactions]).where(transactions: {result: "success"}).group(:id).order("revenue DESC").limit(num_records)
  end

  def self.most_items(num_records)
    unscoped.select("items.*, SUM(invoice_items.quantity) AS total_items").joins(invoice_items: :invoice).group(:id).order("total_items DESC").limit(num_records)
  end

  def self.best_day(item)
    unscoped.select("invoices.created_at, SUM(invoice_items.quantity) AS unit_count").joins(invoice_items: :invoice).where(id: item).group("invoices.created_at").order("unit_count DESC, invoices.created_at DESC")[0]
  end
end
