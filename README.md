[![wercker status](https://app.wercker.com/status/c4780fc9b210a5c21c81807b419b4d10/s "wercker status")](https://app.wercker.com/project/bykey/c4780fc9b210a5c21c81807b419b4d10)

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
|メール送信サーバー|Mandrill||
|メールサーバー|Zoho mail||
|サーバー監視|NewRelic||
|ログ監視|Logentries||
|ドメイン|スタードメイン||
|DNS|AWS Route53||


## 環境
|用途|動作環境|データベース|静的ファイル|
|---|---|---|---|
|ローカル|Webric|ClearDB(artpocket-develop)|S3(dev-cdn.artpocket.me)|
|デベロップメント|Heroku(artpocket-develop)|ClearDB(artpocket-develop)|S3(dev-cdn.artpocket.me)|
|プロダクション|Heroku(artpocket-production)|ClearDB(artpocket-production)|S3(cdn.artpocket.me)|

## DNS
**ルートドメインをwwwへリダイレクト**

|NAME|TYPE|PRIO|CONTENT|
|---|---|---|---|
|artpocket.me|A||ALIAS s3-website-ap-northeast-1.amazonaws.com|
|www.artpocket.me|CNAME||artpocket-production.herokuapp.com|
|*.artpocket.me|CNAME||artpocket-production.herokuapp.com|
|dev.artpocket.me|CNAME||artpocket-development.herokuapp.com|
|cdn.artpocket.me|CNAME||cdn.artpocket.me.s3-ap-northeast-1.amazonaws.com|
|dev-cdn.artpocket.me|CNAME||dev-cdn.artpocket.me.s3-ap-northeast-1.amazonaws.com|
|static.artpocket.me|CNAME||static.artpocket.me.s3-ap-northeast-1.amazonaws.com|
|zb14149405.artpocket.me|CNAME||zmverify.zoho.com|
|artpocket.me|MX|0|mx.zohomail.com|
|artpocket.me|MX|10|mx2.zohomail.com|
|artpocket.me|TXT||v=spf1 include:spf.mandrillapp.com ?all|
|artpocket.me|TXT||v=spf1 mx include:zoho.com ~all|
|mandrill._domainkey.artpocket.me|TXT||v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckaGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;|

## S3-CORS
```
<CORSConfiguration>
<CORSRule>
<AllowedOrigin>*</AllowedOrigin>
<AllowedMethod>GET</AllowedMethod>
<AllowedHeader>Content-*</AllowedHeader>
<MaxAgeSeconds>3000</MaxAgeSeconds>
<AllowedHeader>Authorization</AllowedHeader>
</CORSRule>
</CORSConfiguration>
```
