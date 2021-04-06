# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| introduction       | text   |             |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| bath_day           | date   | null: false |

### Association

- has_one :destination dependent: :destroy
- has_one :card dependent: :destroy
- has_many :products dependent: :destroy
- has_many :comments dependent: :destroy

## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_changes | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| delivery_time    | string     | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false, foreign_key: true |
| brand_id         | integer    | null: false, foreign_key: true |
| shipping_id      | integer    | null: false, foreign_key: true |
| user_id          | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :comments dependent: :destroy

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

## destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | integer    | null: false, foreign_key: true |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| zip_code         | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone        | string     | unique: true                   |

### Association

- belongs_to: user

## category テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| ancestry         | string     |                                |

### Association

- has_many :products