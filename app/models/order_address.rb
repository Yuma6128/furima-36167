class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :address, :phone_number, :building, :user_id, :item_id, :token

  with_options presence: true do
    validates :token, :city, :address, :user_id, :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
  end
  validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, address: address,
                   phone_number: phone_number, building: building)
  end
end
