class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices
  has_many :transactions, through: :invoices

  def self.customers_with_pending_invoices_for_merchant(merchant_id)
    Customer.find_by_sql("SELECT customers.* FROM customers
      INNER JOIN invoices ON invoices.customer_id=customers.id
      INNER JOIN transactions ON transactions.invoice_id=invoices.id
      WHERE invoices.merchant_id=#{merchant_id}
      EXCEPT SELECT customers.* FROM customers
      INNER JOIN invoices ON invoices.customer_id=customers.id
      INNER JOIN transactions ON transactions.invoice_id=invoices.id
      WHERE transactions.result='success' AND invoices.merchant_id=#{merchant_id}")
  end

  def self.favorite_customer_for_merchant(merchant_id)
    Customer.select('customers.*, COUNT(invoices.id) AS icount').joins(:invoices).where("invoices.merchant_id=#{merchant_id}").group('customers.id').order('icount DESC').first
  end
end
