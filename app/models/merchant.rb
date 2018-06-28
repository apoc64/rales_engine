class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :items
  has_many :invoices

  def self.merchants_with_most_revenue(quantity)
    Merchant.select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins("INNER JOIN invoices ON invoices.merchant_id=merchants.id INNER JOIN invoice_items ON invoice_items.invoice_id=invoices.id").group("merchants.id").order("revenue DESC").limit(quantity)
  end
end
