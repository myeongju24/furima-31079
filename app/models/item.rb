class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
    validates :explanation
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :location
  belongs_to :day_to_delivery

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :location_id
    validates :day_to_delivery_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }

end