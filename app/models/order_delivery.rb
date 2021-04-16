class OrderDelivery
  include ActiveModel::Model
  attr_accessor :zip_code, :shipping_area_id, :city, :address, :building_name, :telephone, :product_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid." }
    validates :shipping_area_id, numericality: { other_than: 0 }
    validates :user_id
    validates :product_id
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Delivery.create(zip_code: zip_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, telephone: telephone, order_id: order.id)
  end

end