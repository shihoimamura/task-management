| モデル名 | カラム名 | データ型 |
|----------|----------|----------|
| Task     | id      | integer  |
|          | title   | string   |
|          | content | string   |

# デプロイ方法
1. git add する
```
$ git add .
```
2. コミットする
```
$ git commit -m "コミットログ"
```
3. 以下のコマンドを実行してデプロイ
```
$ git push heroku master
```
4. データベースマイグレーション
```
$ heroku run rails db:migrate
```
