| モデル名 | カラム名 | データ型 |
|----------|----------|----------|
| Task     | id      | integer  |
|          | title   | string   |
|          | content | string   |

# デプロイ方法
1. 以下のコマンドを実行してデプロイ
```
$ git push heroku master
```
2. データベースマイグレーション
```
$ heroku run rails db:migrate
```
