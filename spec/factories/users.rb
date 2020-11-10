FactoryBot.define do
  factory :user do
    nickname              {"みょん"}
    email                 {"kkk@gmail.com"}
    password              {"abcd1234"}
    password_confirmation {password}
    family_name_kanji     {"山田"}
    first_name_kanji      {"太郎"} 
    family_name_kana      {"ヤマダ"} 
    first_name_kana       {"タロウ"} 
    birthday              {"1990-01-24 00:00:00"}
  end
end