# DB設計

## users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               | 
| last_name          | string | null: false               | 
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               | 
| first_name_kana    | string | null: false               |  
| birth_date         | string | null: false               | 

### Association
has_many :items
has_many :shipping_address


## Shipping_address table

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user_id      | references | null: false, foreign_key: true |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address1     | string     | null: false                    |
| address2     | string     |                                |
| phone        | integer    | null: false                    |   

### Association
belongs_to :user


## Credit_card

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user_id      | references | null: false, foreign_key: true |
| card_no      | integer    | null: false                    |

### Association
belongs_to :user

## Items

| Column         | Type    | Options     |
|----------------|---------|-------------|
| image          | string  | null: false |
| item_name      | string  | null: false |
| item_info      | string  | null: false |
| item_categories| string  | null: false |
| item_status    | string  | null: false |
| shipping_fee   | string  | null: false |
| shipping_area  | integer | null: false |
| handling_time  | integer | null: false |

### Association
belongs_to :user

## Comments

| Column  | Type       | Options     |
|---------|------------|-------------|
| user_id | references | null: false |
| item_id | references | null: false |
| text    | text       | null: false |

### Association
belongs_to :user
belongs_to :item