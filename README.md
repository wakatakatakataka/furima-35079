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
| birth_day          | date   | null: false              |

### Association

- has_many :products 
- has_many :comments 
- has_many :orders 

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_change_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :category 
- belongs_to :brand 
- has_many :comments 
- has_one :order

## brands テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| name        | string    | index :true |

### Association

- has_many :products

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |
| text        | text       | null: false                    |

### Association

- belongs_to: user
- belongs_to: product

## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone        | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to: order

## categories テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| ancestry         | string     |                                |

### Association

- has_many :products

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product          | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product
- has_one: delivery