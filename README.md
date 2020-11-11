# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| family_name_kanji | string  | null: false |
| first_name_kanji  | string  | null: false |
| family_name_kana  | string  | null: false |
| family_name_kana  | string  | null: false |
| birthday          | datetime| null: false |

### Association

- has_many : items
- has_many : records

## items テーブル

| Column          | Type       | Options     |
| ----------------| ---------- | ----------- |
| image           |            |             |
| title           | string     | null: false |
| explanation     | text       | null: false |
| category        | string     | null: false |
| condition       | string     | null: false |
| delivery_fee    | integer    | null: false |
| location        | string     | null: false |
| price           | integer    | null: false |
| day_to_delivery | integer    | null: false |
| user_id         | references |             |

### Association

- belongs_to : users
- has_one    : address
- has_one    : record

## address テーブル

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| postal_code  | integer | null: false |
| prefucture   | string  | null: false |
| city         | string  | null: false |
| street       | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |


### Association
- belongs_to : items

## records テーブル

| Column  | Type       | Options     |
| --------| ---------- | ----------- |
| user_id | references |             |
| date    | datetime   | null: false |
| item_id | references |             |

### Association
- belongs_to : users
- belongs_to : items