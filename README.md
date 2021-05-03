


# テーブル設計

## users テーブル

| Column               | Type     |  Options     |  Options      |
| -------------------  | -------- | ------------ | ------------- |
| email                | string   | null: false  | unique :true  |
| encrypted_password   | string   | null: false  |               |
| nickname             | string   | null: false  |               | 


### Association

- has_one :motion
- has_one :meal

##  motioons テーブル

| Column                    | Type               |  Options         |
| --------------------------| ------------------ | ---------------- |
| training1_id              | integer            |                  |
| training2_id              | integer            |                  |
| training3_id              | integer            |                  |
| running                   | integer            |                  |
| user                      | references         | foreign_key:true |

### Association

- berongs_to :user 



## meals テーブル

| Column           | Type               |  Options          |
| -----------------| ------------------ | ----------------- |
| breakfast        | text               |                   |
| lunch            | text               |                   |
| dinner           | text               |                   |
| user             | references         | foreign_key:true  |
### Association

- belongs_to :user

