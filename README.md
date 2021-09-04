## usersテーブル

| Column                    | Type       | Options                |
| ------------------------- | ---------- | ---------------------- |
| nickname                  | string     | null: false            |
| email                     | string     | null: false unique:true|
| encrypted_password        | string     | null: false            |
| last_name                 | string     | null: false            |
| first_name                | string     | null: false            |
| last_name_kana            | string     | null: false            |
| first_name_kana           | string     | null: false            |
| birthday                  | date       | null: false            |


### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column                       | Type         | Options                      |
| ---------------------------- | ------------ | ---------------------------- |
| item_name                    | string       | null: false                  |
| item_explain                 | text         | null: false                  |
| item_category_id             | integer      | null: false                  |
| item_sales_status_id         | integer      | null: false                  |
| item_shipping_fee_status_id  | integer      | null: false                  |
| item_prefecture_id           | integer      | null: false                  |
| item_scheduled_delivery_id   | integer      | null: false                  |
| item_price                   | integer      | null: false                  |
| user                         | references   | null: false foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column         | Type         | Options                      |
| -------------- | ------------ | ---------------------------- |
| user           | references   | null: false foreign_key: true|
| item           | references   | null: false foreign_key: true|


### Association
- belongs_to :item
- has_one :address
- belongs_to :user

## addressesテーブル

| Column             | Type         | Options                      |
| -------------------| ------------ | ---------------------------- |
| postal_code        | string       | null: false                  |
| item_prefecture_id | integer      | null: false                  |
| city               | string       | null: false                  |
| address            | string       | null: false                  |
| phone_number       | string       | null: false                  |
| building           | string       |                              |
| order              | references   | null: false foreign_key: true|

### Association
- belongs_to :order