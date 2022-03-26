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
has_many :shipping


## Shipping table

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