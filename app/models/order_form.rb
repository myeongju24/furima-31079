class FormOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone_number,

  # ここにバリデーションの処理を書く
  validates :postal_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :city
    validates :street
    validates :phone_number
  end
  
  def save
    # 各テーブルにデータを保存する処理を書く
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number)
  end
end