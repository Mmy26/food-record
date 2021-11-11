# README
* アプリケーション名	food recorder

* アプリケーション概要	食事を画像で記録でき、コメント機能を実装したことで他者からのコメントを得られるようにしてあります。

* URL	
  * https://food-record-36994.herokuapp.com/
    * Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性がございます。

* テスト用アカウント	
  * Basic認証 ID	admin
  * Pass	2222

* 利用方法	画像を投稿することで食事を管理することができます。

* 目指した課題解決	
  * 制作背景として、仕事が忙しくなり、健康が気になりだす２０代後半男性をターゲットに、食事を記録し客観的に判断することで、日頃の健康管理に役立てられるものを作りたいということがありました。
    * 第一段階:作業が複雑だと使わなくなることがあるため、投稿する際の項目を単純なものにすることで、煩わしさを減らし長く使い続けられるアプリにする
    * 第二段階:利用することでの価値を増やすために、ニュースAPIを挿入しヘルスケア関連の情報も得られるようにします
    * 第三段階:通知機能を実装し、投稿し忘れを防ぎます
    * 第四段階:コメント機能を利用し、写真投稿するだけでなく、その日のトレーニング情報を登録できるようにします

* 洗い出した要件	
  * ユーザー管理機能
    * ユーザーを新規登録できる
    * ユーザー登録が完了している場合、ロクインすることができる
    * ログアウトができる
  * 写真投稿機能
    * 食事を撮影した写真を投稿できる
    * 食べた分量の感覚を登録できる
    * 投稿した内容は、トップページに表示される
    * 投稿した内容の編集・削除ができる
  * コメント投稿機能
    * 投稿した内容についてコメントができる

* 実装した機能についての画像やGIFおよびその説明	
  * ユーザー管理機能
    * 新規登録ができる


* 実装予定の機能	
  * ニュースAPIを利用し、ヘルスケアの情報も得られるようにする
  * 通知機能を実装し、投稿し忘れを防ぐ
  * コメント機能を活用し、その日行ったのトレーニング情報も合わせて投稿できるようにする

* データベース設計	
  * ER図	test.dio参照

* ローカルでの動作方法	
  * WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
    * ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
  * 接続先およびログイン情報については、上記の通りです。
  * 同時に複数の方がログインしている場合に、ログインできない可能性があります。
  * テストアカウントでログイン→トップページから投稿ボタン押下→投稿情報入力→投稿完了
  * 確認後、ログアウト処理をお願いします。


# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| weight             | integer | null: false               |
| age                | integer | null: false               |
| sex                | string  | null: false               |
| height             | integer | null: false               |


### Association
- has_many :posts
- has_many :comments

## posts テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| content            | string     | null: false               |
| amount             | integer    | null: false               |
| timing             | integer    | null: false               |
| user               | references | null: false               |

### Association
- belongs_to :user
- has_many   :comments

## posts テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| user               | references | null: false               |
| post               | references | null: false               |
| timing             | string     | null: false               |


### Association
- belongs_to :user
- gelongs_to :comments
