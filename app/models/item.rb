class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :location_id
    validates :price
    validates :day_to_delivery_id
  end

  belongs_to :user
end
