# README

# 「アプリ名：Rider’s Garage」
このツールは、バイクパーツ・ウェアを売買できるフリマアプリ。<br>
![Shimokita.php](https://i.gyazo.com/ac59c958ab77349220ecf35d9a7b5d8a.jpg)
<br>
<br>
<br>
# Production background
このツールを作成したのは、今コロナウイルスの影響で電車通勤ではなく原付ないしバイクで<br>
通勤している人が増えています。<br>その為、現在Hondaのバイクは2ヶ月入荷待ち状態との事です。<br>
当然バイクの需要が増えれば、それらに付随するパーツないし、アクセサリー(メットやグローブ等)が<br>
必要になる割合が増加します。<br>
そこで、それらのパーツを安く欲しい人と、逆に不要になった人を繋げるサイトとして、<br>
このバイクのパーツ用品等を専門にするフリマサイトを作成しました。<br>
またこれを気に、バイク好きのわたくしとしては、バイクを好きになってくれる人が増えればとも思っています。
<br>
<br>
<br>

# Features
このツールは、バイク用品のみの取り扱いに限ります。<br>
そうする事で、同じような商品が集まり、価格競争が起こればバイク用品を<br>
安く購入出来るサイトして強みを得られる為です。
<br>
<br>
<br>

# Description
このツールは、ECサイトです。<br>
基本的なログイン機能や商品を出品する為の機能だけでなく、<br>
FacebookやTwitterのアカウントからログイン出来る機能や、<br>
良いね機能等搭載しています。また、クレジットカードでの決済を可能にしています。<br>
より充実した機能を今後も増やしていく予定です。
<br>
<br>
<br>

# Demo
![Shimokita.php](https://i.gyazo.com/94df8b1a299ba3bfb1fc46617b4ef156.gif)
<br>
<br>

![Shimokita.php](https://i.gyazo.com/a3ae909b098bb0932f95890d6b54a7fe.gif)
<br>
<br>

![Shimokita.php](https://i.gyazo.com/dc8bedcff3038f771f3fb9cc467d8c56.gif)
<br>
<br>

![Shimokita.php](https://i.gyazo.com/ee58a0cfa5f346c45bb1bf0cb6f6b408.gif)
<br>
<br>
<br>

# Usage
```
$ git clone https://github.com/1110025y/sample4.git
```

<br>
<br>
<br>

# Downloading and installing steps
1. Clone this repository
```
$ git clone https://github.com/1110025y/sample4.git
```

2. Go into the repository
```
$ cd sample4
```

3. Install dependencies
```
$ bundle install
```

4. Create database, Run migrations and set up the database
```
$ rails db:create
$ rails db:migrate
```

5. Run the app
```
$ rails s
```
→http://localhost:3000
<br>
<br>
<br>

# Author
・Github: 1110025y
<br>
<br>
<br>

# Requirement
Rails 6.0.3.2
<br>
<br>
<br>

# License
[MIT](https://choosealicense.com/licenses/mit/) 


<br>
<br>
<br>
<br>

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|password_confirmation|string||
|first＿name|string|null: false|
|family_name|string|null: false|
|first＿name_kana|string|null: false|
|family_name_kana|string|null: false|

### Association
- has_many: items
- has_many :comments
- has_one :address, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :sns_credentials
<br>
<br>

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|introduction|text|null: false|
|status_id|integer|null: false||
|prefecture_id|integer|null: false|
|delivery_fee_id|string|null: false||
|shipping_date_id|string|null: false|
|category|references|null: false, foreign_key: true|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category

- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :status

- has_many :comments
- has_many :images
- accepts_nested_attributes_for :images, allow_destroy: true
- has_many :images, dependent: :destroy
<br>
<br>

# categoriesテーブル
### 商品カテゴリ
|Column|Type|Options|
|------|----|-------|
|ancestry|string|null: false|
|name|string|null: false|

### Association
- has_many: items
<br>
<br>

# imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|item_image|string|null: false|

### Association
- belongs_to : item
<br>
<br>

# shippingdatesテーブル
### 発送までの日数
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: items
<br>
<br>

# delivery_feesテーブル
### 配送料の負担
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: items
<br>
<br>


# statusesテーブル
### 商品の状態
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: items
<br>
<br>


# prefecturesテーブル
### 発送元の地域
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: items
<br>
<br>

# credit_cardsテーブル
### クレジットカード登録と決算
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user
<br>
<br>

# commentsテーブル
### 商品への質問コメント
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|text|text|null: false|

### Association
- belongs_to :item
- belongs_to :user
<br>
<br>

# addressesテーブル
### 登録者の住所登録
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|apartment|string|null: false|
|phone_number|text|null: false|
|user_id|integer||
|contact|text||

### Association
- belongs_to :user

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to_active_hash :prefecture
<br>
<br>

# sns_credentials ### SNS認証
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user|references|null: false, foreign_key: true|


### Association
- belongs_to :user, optional: true