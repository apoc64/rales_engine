class ItemSerializer < ActiveModel::Serializer
  attributes :description, :id, :merchant_id, :name, :unit_price

  def unit_price
    BigDecimal.new(object.unit_price)
  end
end
