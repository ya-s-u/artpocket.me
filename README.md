# アートポケット(web,api)

## 使用スタック
|用途|名前|バージョン|
|---|---|---|
|アプリケーション|Ruby on Rails |4.1.6|
|データベース|ClearDB(MySQL)||
|キャッシュ|memcached||
|テスト|Rspec||
|CI|wercker||
|ホスティング|Heroku(nginx+unicorn)||
|ファイルサーバー|AWS S3||
|メールサーバー|Mandrill||
|サーバー監視|NewRelic||
|ログ監視|Logentries||


## 環境
|用途|動作環境|データベース|静的ファイル|
|---|---|---|---|
|ローカル|Webric|ClearDB(artpocket-develop)|S3(dev-cdn.artpocket.me)|
|デベロップメント|Heroku(artpocket-develop)|ClearDB(artpocket-develop)|S3(dev-cdn.artpocket.me)|
|プロダクション|Heroku(artpocket-production)|ClearDB(artpocket-production)|S3(cdn.artpocket.me)|
