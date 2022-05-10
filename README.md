# DB設計

## Users 

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               | 
| last_name          | string | null: false               | 
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               | 
| first_name_kana    | string | null: false               |  
| birth_date         | date   | null: false               | 


### Association
- has_many :items
- has_many :orders
- has_many :comments

##  Addresses

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address1      | string     | null: false                    |
| address2      | string     |                                |
| phone         | string     | null: false                    |  
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order


## Items

| Column                | Type       | Options                       |
|-----------------------|------------|-------------------------------|
| item_name             | string     | null: false                   |
| item_info             | text       | null: false                   |
| item_category_id      | integer    | null: false                   |
| sale_status_id        | integer    | null: false                   |
| shipping_fee_id       | integer    | null: false                   |
| prefecture_id         | integer    | null: false                   |
| scheduled_delivery_id | integer    | null: false                   |
| price                 | integer    | null: false                   |
| user                  | references | null: false, foreign_key: true|


### Association
- has_one :order
- belongs_to :user
- has_many :comments

## Comments

| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| user    | references | null: false, foreign_key: true|
| item    | references | null: false, foreign_key: true|
| text    | text       | null: false                   |

### Association
- belongs_to :user
- belongs_to :item

## Orders

| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| user    | references | null: false, foreign_key: true|
| item    | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_adress