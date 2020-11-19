class Address < ApplicationRecord

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :city
    validates :street
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "Input only number"}
  end
  
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
