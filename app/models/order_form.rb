class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number,length: { maximum: 11 }, format: {with: /\A[0-9]+\z/, message: "Input only number"}
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end