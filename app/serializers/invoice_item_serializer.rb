class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :invoice_id, :id, :item_id, :quantity, :unit_price
end
