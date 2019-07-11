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

## usersテーブル

|Column|type|Option|
|------|----|------|
|name_kanji|string|null: false|
|name_kana|string|null: false|
|nickname|string|null: false|
|birthday|datetime|null: false|
|phone_number|string|unique: ture, null: false|
|comment|text| |

### Association
- has_many :messages
- has_many :residences
- has_one :card
- has_many :items
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

## residencesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|post_code|string|null: false|
|prefecture_id|references|foreign_key: true|
|city|string|null: false|
|address1|string| |
|address2|string| |


### Association
- belongs_to :user
- belongs_to :prefecture



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|foreign_key: true|
|card_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explain|text|null: false|
|category_id|refernces|foreign_key: true|
|delivery_type_id|references|foreign_key: true|
|delivery_date_id|references|foreign_key: true|
|price|integer|null: false|
|buyer_id|references|foreign_key: true|
|saler_id|references|foreign_key: true|
|city_id|references|foreign_key: true|
### Association
- has_many :messages
- has_many :images
- belongs_to :category
- belongs_to :status
- belongs_to :delivery_type
- belongs_to :delivery_date
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :city

## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :residences
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|strings| |
|ancesrry|string| |
### Association
- has_ancestry
- has_many :items

## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|text|strings|  |
### Association
- has_many :items

## delivery_typeテーブル
|Column|Type|Options|
|------|----|-------|
|type|strings|  |
### Association
- has_many :items

## delivery_dateテーブル
|Column|Type|Options|
|------|----|-------|
|date|strings|  |
### Association
- has_many :items
