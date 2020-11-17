class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street
    validates :phone_number
  end
  belongs_to :order
end
