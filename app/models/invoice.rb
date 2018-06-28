class Invoice < ApplicationRecord
  validates :status, presence: true

  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  def self.revenue_by_date(date)
    # binding.pry
    Invoice.where("invoices.updated_at BETWEEN '#{date}' AND '#{date + 1}'").joins(:invoice_items).joins(:transactions).where("transactions.result='success'").sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
