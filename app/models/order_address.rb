class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id ,:city ,:address,:phone_number,:building,:order_id,:user_id,:item_id 

  with_options presence: true do
    validates :user_id,:item_id,:order_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,format: {with: /^\d{11}$/}
  end
    validates :item_prefecture_id,numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code,item_prefecture_id: item_prefecture_id,city: city,address: address,phone_number: phone_number,building: building,order_id: order.id)
  end

end