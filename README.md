# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| bath_day           | date   | null: false              |

### Association

- has_one :destination dependent: :destroy
- has_one :card dependent: :destroy
- has_many :products dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :orders dependent: :destroy

## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | string     | null: false                    |
| condition        | integer    | null: false                    |
| shipping_change  | integer    | null: false                    |
| shipping_area    | integer    | null: false                    |
| delivery_time    | integer    | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| seller_user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :comments dependent: :destroy
- has_one :order

## card テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| user_id     | integer   | null: false, foreign_key: true |
| customer_id | string    | null: false                    |
| card_id     | string    | null: false                    |

### Association

- belongs_to :user

## brand テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| name        | string    | index :true |

### Association

- has_many :products

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| product_id  | references | null: false, foreign_key: true |
| text        | text       | null: false                    |

### Association

- belongs_to: user
- belongs_to: product

## delivery テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone        | string     | unique: true                   |

### Association

- belongs_to: order

## category テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| ancestry         | string     |                                |

### Association

- has_many :products

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer_user_id    | references | null: false, foreign_key: true |
| product_id       | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product
- has_one: delivery