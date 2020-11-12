class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
    validates :price
    validates :day_to_delivery_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :location

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :location, numericality: { other_than: 1 }
end