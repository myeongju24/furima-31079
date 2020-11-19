class Address < ApplicationRecord

  validates :postal_code, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :city
    validates :street
    validates :phone_number
  end

  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
