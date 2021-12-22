# アプリケーション名
  - dietary management space
  - URL
   - https://dm-space.herokuapp.com/

# アプリケーション概要
  - 写真投稿＋コメント専用アプリで、トレーナーアカウントとクライアントアカウントでユーザー登録を分けています。
  - クライアントは日々の食事内容を写真付きの説明文で投稿し、トレーナーがコメントにてFBをします
  - クライアント同士でもコメントを投稿することができ、いいねボタンを押下することで投稿に対してのリアクションをすることができます。


# 利用方法
  - WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
  - 接続先接続先およびログイン情報については上記の通りです。
  - テストアカウント（クライアント）でログイン→TOPページから投稿ボタン押下→投稿内容入力→投稿完了。
  - テストアカウント（トレーナー）でログイン→TOPページにある投稿をクリック→投稿詳細ページにてコメント入力の上コメントボタンを押下→いいねボタンを押下→コメント、いいね完了。

# 目指した課題解決
  - 現在パーソナルトレーナーとしてクライアントの食事管理も業務の一環として行っており、  
  実施方法としてはLINEにて食事の写真を送付してもらい、FBを送るという1to1の管理方法です。  
  実際によくあるクライアントからのお声として、他のクライアントの食事がどんなものか見てみたい、  
  一人だとモチベーションが下がる、などがあげられます。  
  今回実装したアプリを使用することで、クライアント同士が食事内容を共有し、  
  どんなものを食べているのか、こんなものも食べて良いのかなど、食品や料理のバリエーションを  
  増やすこともできます。また、クライアント同士での共有、コメント、いいねなどの  
  リアクションがあることで食事管理のモチベーション低下を防ぐ狙いです。

# 機能一覧
  - ログイン機能
    - トレーナー用、クライアント用で分けるため、deviseの複数モデル機能使用
  - 投稿機能
    - 画像投稿(ActiveStorage),画像カルーセル表示
  - コメント機能
  - いいね機能

# テスト
  - RSpec
    - モデルの単体テスト

# データベース設計

## clients テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| profile            | text    | null: false               |
| diet_history       | string  | null: false               |

### Association

- has_many :posts
- has_many :comments
- has_many :likes

## trainersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| profile            | text    | null: false               |

### Association

- has_many :posts
- has_many :comments
- has_many :likes

## postsテーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| title       | string      | null: false                    |
| date        | date        | null: false                    |
| explanation | text        | null: false                    |
| client      | refelences  | null: false, foreign_key: true |

### Association

- belongs_to :client

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| trainer | references | null: false  foreign_key: true |
| client  | references | null: false  foreign_key: true |
| post    | refelences | null: false, foreign_key: true |

### Association

- belongs_to :trainer
- belongs_to :client
- belongs_to :post

## likesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| trainer | references | null: false  foreign_key: true |
| client  | references | null: false  foreign_key: true |
| post    | refelences | null: false, foreign_key: true |

### Association

- belongs_to :trainer
- belongs_to :client
- belongs_to :post