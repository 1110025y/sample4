# README

# 「アプリ名：Rider’s Garage」
このツールは、バイクパーツ・ウェアを売買できるフリマアプリ。<br>
![Shimokita.php](https://i.gyazo.com/18f8ab17dbdf1311194687f313c945ba.jpg)
<br>
<br>
<br>
# Production background
このツールを作成したのは、今コロナウイルスの影響で電車通勤ではなく原付ないしバイクで通勤している人が増えています。<br>
その為、現在Hondaのバイクは2ヶ月入荷待ち状態との事です。<br>
当然バイクの需要が増えれば、それらに付随するパーツないし、アクセサリー(メットやグローブ等)が必要になる割合が増加します。<br>
そこで、それらのパーツを安く欲しい人と、逆に不要になった人を繋げるサイトとして、<br>
このバイクのパーツ用品等を専門にするフリマサイトを作成しました。<br>
またこれを気に、バイク好きのわたくしとしては、バイクを好きになってくれる人が増えればとも思っています。
<br>
<br>
<br>

# Features
このツールは、バイク用品のみの取り扱いに限ります。<br>
そうする事で、同じような商品が集まり、価格競争が起こればバイク用品を安く購入出来るサイトして強みを得られる為です
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
![Shimokita.php](https://i.gyazo.com/27fe61a6bb37d122851686d3a107eb4b.gif)
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
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :tweets
- has_many :comments
- has_one :message, dependent: :destroy
<br>

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
<br>

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user
<br>

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|introduction|text|null: false|
|hobby|string|null: false|
|skill|string|null: false|
|likes|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
<br>

## blogsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|title|integer|null: false|
|start_time|datetime|null: false|