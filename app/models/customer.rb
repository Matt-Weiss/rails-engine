class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.favorite_customer(merchant)
    select("customers.*, COUNT(invoices.merchant_id) AS count_id")
    .joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .where("invoices.merchant_id = #{merchant}")
    .group(:id)
    .order("count_id DESC")
    .first
  end

  def self.boss_mode(merchant)
    find_by_sql("SELECT c.*, i.id invoice_id FROM invoices i LEFT OUTER JOIN transactions t ON t.invoice_id = i.id INNER JOIN customers c ON c.id = i.customer_id WHERE (t.result is null OR t.result = 'failed') AND i.merchant_id = #{merchant} EXCEPT SELECT c.*, i.id invoice_id FROM invoices i INNER JOIN transactions t ON t.invoice_id = i.id INNER JOIN customers c ON c.id = i.customer_id WHERE t.result = 'success' AND i.merchant_id = #{merchant}")
  end
end
