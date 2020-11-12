class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
    validates :delivery_fee_id
    validates :location_id
    validates :price
    validates :day_to_delivery_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }

end