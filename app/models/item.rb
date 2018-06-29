class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope { order(:id) }

  def self.highest_revenue_items(quantity)
    Item.find_by_sql(
      "SELECT items.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue
      FROM items
      INNER JOIN invoice_items ON invoice_items.item_id=items.id
      GROUP BY items.id
      ORDER BY revenue DESC
      LIMIT #{quantity}")
  end

  def self.most_sold_items(quantity)
    Item.unscoped.select("items.*, SUM(invoice_items.quantity) AS sales")
        .joins(:invoice_items)
        .group(:id)
        .order("sales DESC")
        .limit(quantity)
  end
end
