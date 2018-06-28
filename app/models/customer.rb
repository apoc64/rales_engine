class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices
  has_many :transactions, through: :invoices

  def self.favorite_customer_for_merchant(merchant_id)
    Customer.select('customers.*, COUNT(invoices.id) AS icount').joins(:invoices).where("invoices.merchant_id=#{merchant_id}").group('customers.id').order('icount DESC').first
  end
end
