# アプリケーション名 

- management_app

# アプリケーションの概要

- このアプリケーションでは目標を立てて予定を管理したりする

# URL

- https://management-app123.herokuapp.com/

# テスト用アカウント

- emil: hogehoge@gmail.com
- パスワード: hogehoge

# 利用方法

- 新規登録を行いログインを行う
- headerの今日の目標を設定するをクリックするとform画面に遷移して現在の体重や今日行う運動やメモなどを記述して決定ボタンをクリックすると内容が保存されてトップページに表示され観覧できる。
- headerのカレンダーをクリックするとカレンダーページに遷移して、新規予定作成をクリックすると新規予定作成ページに遷移して日付や予定を記述して送信することでカレンダーに予定が反映される
# 課題解決

- 利用者として20代〜70代を対象とし、健康維持や、生活の効率化を図りたい人を対象
# 解決したい課題
- ①何かしら目標の達成のための計画を立てて実行,やり遂げるために必要な遂行力の向上を図る
目的を絞り無駄な考えや行動を最小限に抑えて密度の濃い日々を過ごすため
- ②自分のことを把握する.
自分の体に合った運動の仕方や継続できるかを明確にする。

# 洗い出した用件

##	ユーザー管理機能
- 目的: ユーザー管理機能をつくることで個人の情報を作成、表示,編集したりできるようにする
- 詳細:	emailとパスワードを記述することで新規登録できるようにして、ログインする際もemailとパスワードを記述するようしてログインしている時はログアウト機能を持たせる。
- ストーリー: 新規登録する際は新規登録ボタンを押してemailとパスワードを打ち込む必要があるログインする際はログインボタンを押して新規登録した情報を打ち込む必要がある.ログイン中はログアウトできるようにする。
## 2	自己管理情報登録機能
- 目的: 管理情報を登録することで現在の体重などを参考に今日運動するかどうかをを決めたり、予定を決めたりする。
- 詳細: 現在の体重の記入欄,運動の記入欄、メモ記入欄に記述することで保存の処理を行える。
- ストーリー: 今日行う情報登録画面に遷移して記入欄に記述を行って，終えたらボタンを押すと保存の処理が行われる。

## 3	ユーザー情報表示機能
- 目的: 本日行う情報を表示することでやることを明確にする
- 詳細: トップページに本日行う情報を表示する。
- ストーリー: ログインしたらそのユーザーの情報を表示するようにする。
## 4	履歴表示機能
- 目的: 過去の情報を見れるようにすることで自分でノルマを設定したり見直したりすることで今後の自己管理のモチベーションにつながることを期待している
-	詳細: 自己管理情報登録で今まで保存した内容を一覧で確認することができる。	
- ストーリー: ログインしたユーザーだけが過去の情報を見れるリンクを表示してクリックすると過去の履歴に遷移できる。
## 5	自己管理情報編集機能
- 目的: 情報を誤って記述したり、変更などをしたい時に編集できるようにする。
- 詳細:	行う予定を編集することができる。
- ストーリ-: 編集ボタンをクリックすると編集ページに遷移して編集を行うことで情報更新できる
## 6	自己管理情報削除機能
- 目的: 予定をなかったことにしたい時に削除できるようにする	
- 詳細: 予定を削除できる	
- ストーリー: 削除ボタンをクリックするとスク序ページに遷移して編集を行うことで情報を削除することができる
## 7	カレンダー機能
- 目的: カレンダーを見ながら予定を入れてやることを明確にする。	
- 詳細: カレンダーに予定を入れるとその情報が入れた日にちに表示される。	
- ストーリー: カレンダーをクリックすることでカレンダーのページに遷移して新規予定作成をクリックすることで予定の作成ページに遷移して日付と予定を記述して送信するとカレンダーページにリダイレクトして入れた情報が反映される。
## 8 予定完了機能
- 目的: 明確にすることができる
- 詳細: 予定をクリックするとCSSが適用され背景色が変化する
- ストーリー: 予定作成ページで予定を作成し送信することでトップページに移動し予定表が表示されているのでクリックすると完了を行える
## 9 体重推移グラフ機能
- 目的: 過去の体重をグラフ上にすることで日々の変化を可視化することで食事の見直し、運動の負荷などの調整を意識してもらうため
- 詳細: トップページにグラフ上で過去の体重を見ることができる
- ストーリー: 予定作成ページで体重を入力するフォームに値を入力して送信することでトップページに表示される。
# テーブル設計

## users テーブル

| Column               | Type     |  Options     |  Options      |
| -------------------  | -------- | ------------ | ------------- |
| email                | string   | null: false  | unique :true  |
| encrypted_password   | string   | null: false  |               |
| nickname             | string   | null: false  |               | 
| height               | float    | null: false  |               | 


### Association

- has_many :motions

##  motioons テーブル

| Column                    | Type               |  Options         |
| --------------------------| ------------------ | ---------------- |
| weight                    | float              | null: false      |
| plans1                    | string             | null: false      |
| plans2                    | string             |                  |
| plans3                    | string             |                  |
| plans4                    | string             |                  |   
| plans5                    | string             |                  |
| count1                    | integer            | null: false      |
| count2                    | integer            |                  |
| count3                    | integer            |                  |
| count4                    | integer            |                  |
| count5                    | integer            |                  |
| memo                      | text               |                  |
| user                      | references         | foreign_key:true |


### Association

- belongs_to :user

## meetings テーブル

| Column                    | Type               |  Options         |
| --------------------------| ------------------ | ---------------- |
| name                      | datetime           | null: false      |
| start_time                | string             | null: false      |
| user                      | references         | foreign_key      |
p
### Association

- belongs_to :user


  




