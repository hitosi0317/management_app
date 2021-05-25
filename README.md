# アプリケーション名 

- management_app

# アプリケーションの概要

- このアプリケーションでは目標を立てて予定を管理したりする

# URL

- https://management-app123.herokuapp.com/

- テスト用アカウント

# 利用方法
 
# 課題解決

# 洗い出した用件




# テーブル設計

## users テーブル

| Column               | Type     |  Options     |  Options      |
| -------------------  | -------- | ------------ | ------------- |
| email                | string   | null: false  | unique :true  |
| encrypted_password   | string   | null: false  |               |
| nickname             | string   | null: false  |               | 


### Association

- has_many :motion

##  motioons テーブル

| Column                    | Type               |  Options         |
| --------------------------| ------------------ | ---------------- |
| weight                    | float              | null: false      |
| training1                 | string             | null: false      |
| training1                 | string             |                  |
| training2                 | string             |                  |
| training3                 | string             |                  |
| training4                 | string             |                  |
| training5                 | string             |                  |
| count1                    | integer            | null: false      |
| count2                    | integer            |                  |
| count3                    | integer            |                  |
| count4                    | integer            |                  |
| count5                    | integer            |                  |
| memo                      | text               |                  |
| user                      | references         | foreign_key:true |


### Association

- berongs_to :user 




