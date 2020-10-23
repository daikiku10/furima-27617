# テーブル設計

## users テーブル
| Column      | Type    | Options                   |
| ----------- | ------- | ------------------------- |
| nickname    | string  | null: false               |
| email       | string  | null: false, unique: true |
| password    | string  | null: false               |
| last_name   | string  | null: false               |
| first_name  | string  | null: false               |
| birth_year  | integer | null: false               |
| birth_month | integer | null: false               |
| birth_day   | integer | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explain         | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_burden | string     | null: false                    |
| delivery_area   | string     | null: false                    |
| delivery_day    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | string     | null: false                    |
| expire_month  | integer    | null: false                    |
| expire_year   | integer    | null: false                    |
| security_code | string     | null: false                    |
| postal_code   | string     | null: false                    |
| province      | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order