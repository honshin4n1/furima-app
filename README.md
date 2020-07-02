## items(商品)テーブル
|Column|Type|Options|
|------|----|-------|
|name|string| null: false)|
|introduction|text| null:false|
|price|integer|null: false|
|size|string|null: false|
|condition|string|null: false|
|deal_state|boolean| default: 0, null: false, default: false |
|buyer|integer| - |
|user_id|reference|null: false, foreign_key: true|
|brand_id|references| foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|prefecture_id|integer|null: false|
|preparation_day_id|integer|null: false|
|postage_payer_id|integer|null: false|
### Association
 - has_many: comments, dependent: destroy
 - has_many: item_images, dependent: destroy
 - has_many: evaluations
 - has_many: favorites
 - belongs_to: category
 - belongs_to: brand
 - belongs_to: user
 - belongs_to: postage_payer
 - belongs_to: preparation_day
 - belongs_to_active_hash :prefecture


## users（会員）テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, index:true|
|email|string|null: false, unique: true, index:true|
|password|string|null: false|
### Association
 - has_many: comments, dependent: destroy
 - has_many: favorites
 - has_many: evaluations
 - has_one: profile, dependent: destroy
 - has_one: sending_destination, dependent: destroy
 - has_one: credit_card, dependent: destroy
 - 


## sending_destinations(配送目的地)テーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null :false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null:false|
|house_number|string|null: false|
|building_name|string| - |
|phone_number|string|unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## cards(クレジットカード)テーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|customer_id|string|null: false|
|user_id|integer| null: false, foreign_key: true|
### Association
- belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
belongs_to: user
belongs_to: item


## postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payer|string|null: false|
|item|references|null: false, foreign_key: true|
### Association
belongs_to: item


## preparation_daysテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
 - belongs_to:item

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|introduction|string|null: true|
|yaer|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
<!-- |post_code|string|null: true|
|prefecture|string|null: true|
|city|string|null: true|
|house_number|string|null: true|
|building_name|string|null: true|
|phone_number|string|unique: true|
|user_id|references|null: false, foreign_key: true| -->
### Association
belongs_to: user


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evalution| integer | default: 0, null: false|
|review|string| - |
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to: user
belongs_to: item


## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
belongs_to: user
belongs_to: item


## brands(ブランド)テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: true|
### Association
- has_many :items


## categoriesテーブル(商品のカテゴリー)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items
- has_ancestry

## item_imagesテーブル(商品の画像)
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
