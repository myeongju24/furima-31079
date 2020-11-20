FactoryBot.define do
  factory :order_form do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {"460-8501"}
    prefecture_id {24}
    city          {"名古屋市中区"}
    street        {"三の丸 3-1-2"}
    building      {"愛知県庁"}
    phone_number  {"09056373939"}
    user_id       {1}
    item_id       {1}
  end
end