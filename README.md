## usersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nick_name            | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_passworld  | string     | null: false                    |
| last_name            | string     | null: false                    |
| first_name           | string     | null: false                    |
| last_name_ruby       | string     | null: false                    |
| first_name_ruby      | string     | null: false                    |
| year                 | string     | null: false                    |
| month                | string     | null: false                    |
| date                 | string     | null: false                    |

### Association
- has_many :items
- has_many :orders
- has_many :addresses

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| content              | text       | null: false                    |
| category             | string     | null: false                    |
| state                | string     | null: false                    |
| delivery_charge      | string     | null: false                    |
| consignor_address    | string     | null: false                    |
| term                 | string     | null: false                    |
| price                | integer    | null: false                    |
| sell_user            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order
- has_one :address

## ordersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| buy_user             | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | string     | null: false                    |
| prefecture           | string     | null: false                    |
| city                 | string     | null: false                    |
| address_number       | string     | null: false                    |
| build                | string     |                                |
| telephone_number     | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :order

