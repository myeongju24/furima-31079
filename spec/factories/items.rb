FactoryBot.define do
  factory :item do
    title              {"テスト"}
    explanation        {"テスト"}
    category_id        {2}
    condition_id       {2}
    delivery_fee_id    {2}
    location_id        {2}
    day_to_delivery_id {2}
    price              {1000}
    association :user 
  end
end
