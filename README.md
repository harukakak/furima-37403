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
| birthday             | date       | null: false                    |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| content              | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| charge_id            | integer    | null: false                    |
| area_id              | integer    | null: false                    |
| term_id              | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | string     | null: false                    |
| area_id              | integer    | null: false                    |
| city                 | string     | null: false                    |
| address_number       | string     | null: false                    |
| build                | string     |                                |
| telephone_number     | string     | null: false                    |
| order                | references | null: false,foreign_key:true   |

### Association
- belongs_to :order

