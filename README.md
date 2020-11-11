# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| family_name_kanji  | string   | null: false |
| first_name_kanji   | string   | null: false |
| family_name_kana   | string   | null: false |
| family_name_kana   | string   | null: false |
| birthday           | datetime | null: false |

### Association

- has_many : items
- has_many : records

## items テーブル

| Column             | Type       | Options           |
| -------------------| ---------- | ----------------- |
| title              | string     | null: false       |
| explanation        | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| delivery_fee_id    | integer    | null: false       |
| location_id        | integer    | null: false       |
| price              | integer    | null: false       |
| day_to_delivery_id | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to : user
- has_one    : record

## address テーブル

| Column        | Type       | Options           |
| --------------| ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefucture_id | integer    | null: false       |
| city          | string     | null: false       |
| street        | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| record        | references | foreign_key: true |

### Association
- belongs_to : record

## records テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one    : address