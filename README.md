# アプリケーション名
  - dietary management space

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

# 実装予定の内容
  1.ビューファイル作成
    - 各機能に沿ったページを表示できるように、TOPページ、、投稿詳細ページ、投稿編集ページ、削除完了ページを作成。
  2.ログイン機能
    - ユーザーアカウント作成のため実装。トレーナー用、クライアント用で分ける。
  3.SNS認証機能
    - アカウント作成の選択肢を増やすため、Google,Facebookアカウントを利用したログイン機能を追加する。
  4.投稿機能
    - 食事内容を写真付きで投稿するため、写真、日付、タイトル、説明文などを投稿できる機能を実装する。
  5.投稿の編集機能
    - 誤った投稿をした場合編集できるようにするため、投稿機能で記した情報全てを編集できるようにする機能を実装。
  6.投稿の削除機能
    - 誤った投稿をした場合削除できるようにするため、投稿機能で記した情報全てを悪女できるようにする機能を実装。
  7.コメント機能
    - ユーザーの投稿に対してアドバイスできるようにするため、他のユーザーの投稿に対してコメントできる機能を実装。
  8.評価機能
    - ユーザーのモチベーションをアップさせるため、投稿に「いいね！」できる機能を実装。


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