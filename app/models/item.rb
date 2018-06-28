class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope { order(:id) }

  def self.highest_revenue_items(quantity)
    Item.select("items.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(:invoice_items).group(:id).order("revenue DESC").limit(quantity)
  end
end
