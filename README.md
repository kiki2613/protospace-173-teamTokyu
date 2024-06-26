# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## prototypeテーブル

| Colum          | Type      | Options       |
| -------------- | --------- | ------------- |
| title          | string    | null: false   |
| catch_copy     | text      | null: false   |
| concept        | text      | null: false   |
| user           | reference | null: false, foreign_key: true |


## Association
- belongs_to :user
- has_many :comment


## userテーブル

| Colum              | Type      | Options       |
| ------------------ | --------- | ------------- |
| email              | string    | null: false   |
| encrypted_password | string    | null: false   |
| name               | string    | null: false   |
| profile            | text      | null: false   |
| occupation         | text      | null: false   |
| position           | text      | null: false   |


## Association
- has_many :prototype
- has_many :comment


## commentsテーブル

| Colum              | Type         | Options       |
| ------------------ | ------------ | ------------- |
| content            | text         | null: false   |
| prototype          | reference    | null: false, foreign_key: true   |
| user               | reference    | null: false, foreign_key: true   |


## Association
- belongs_to :prototype
- belongs_to :user