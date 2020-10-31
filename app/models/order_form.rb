class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :builing_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number
  end

  def save
    order = Order.create
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, hbuilding_name: builing_name, phone_number: phone_number, order_id: order_id)
  end
end


