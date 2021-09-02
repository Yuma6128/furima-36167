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
| birthday                  | string     | null: false            |


### Association
- has_many :items


## itemsテーブル

| Column                       | Type         | Options                      |
| ---------------------------- | ------------ | ---------------------------- |
| item_name                    | string       | null: false                  |
| item_explain                 | string       | null: false                  |
| item_category_id             | integer      | null: false                  |
| item_sales_status_id         | integer      | null: false                  |
| item_shipping_fee_status_id  | integer      | null: false                  |
| item_prefecture_id           | integer      | null: false                  |
| item_scheduled_delivery_id   | integer      | null: false                  |
| item_price                   | string       | null: false                  |
| user                         | references   | null: false foreign_key: true|

### Association
- belongs_to :user
- belongs_to :order

## ordersテーブル

| Column         | Type         | Options                      |
| -------------- | ------------ | ---------------------------- |
| card_number    | string       | null: false                  |
| card_exp_month | string       | null: false                  |
| card_exp_year  | string       | null: false                  |
| card_cvc       | string       | null: false                  |
| user           | references   | null: false foreign_key: true|
| item           | references   | null: false foreign_key: true|


### Association
- belongs_to :item
- belongs_to :address

## addressesテーブル

| Column         | Type         | Options                      |
| -------------- | ------------ | ---------------------------- |
| postal_code    | integer      | null: false                  |
| prefecture     | string       | null: false                  |
| city           | string       | null: false                  |
| address        | string       | null: false                  |
| phone_number   | string       | null: false                  |
| order          | references   | null: false foreign_key: true|

### Association
- belongs_to :order