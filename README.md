## usersテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| last-name       | string     | null: false |
| first-name      | string     | null: false |
| last-name-kana  | string     | null: false |
| first-name-kana | string     | null: false |


### Association
- has_many :items

## itemsテーブル

| Column                    | Type         | Options                      |
| ------------------------- | ------------ | ---------------------------- |
| item-image                | string       | null: false                  |
| item-name                 | string       | null: false                  |
| item-explain              | string       | null: false                  |
| item-category             | string       | null: false                  |
| item-sales-status         | string       | null: false                  |
| item-shipping-fee-status  | string       | null: false                  |
| item-prefecture           | string       | null: false                  |
| item-scheduled-delivery   | string       | null: false                  |
| item-price                | string       | null: false                  |
| user                      | refernce     | null: false foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column         | Type         | Options                      |
| -------------- | ------------ | ---------------------------- |
| card-number    | string       | null: false                  |
| card-exp-month | string       | null: false                  |
| card-exp-year  | string       | null: false                  |
| card-cvc       | string       | null: false                  |
| postal-code    | string       | null: false                  |
| prefecture     | string       | null: false                  |
| city           | string       | null: false                  |
| addresses      | string       | null: false                  |
| phone-number   | string       | null: false                  |
| item           | refernce     | null: false foreign_key: true|

### Association
- belongs_to :item