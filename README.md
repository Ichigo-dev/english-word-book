# (サービス名)翻訳アプリとして使う英単語帳
日常生活の中でプログラムを書いたり、学校の課題をやったり、私たちは英語を用いることは避けられない。  
現代では便利な翻訳サービスがたくさんあり、英語が全く分からない、などと言うことはあまり無いが、出来ることなら自分で読めるようになりたいものである。  
そんな気持ちから生まれたサービスが(サービス名)である。

# 機能
- 英語<=>日本語で文章、単語を翻訳することができる。
- 調べた単語がそのまま単語帳になって見ることができる。
- 各単語ごとに何回調べたかがカウントされていく。
- 英単語に登録されたものの中から、自分だけの問題集を作ることができる。
- 匿名時は翻訳サイトとして使用できる。

# 実装
- フロントはvue.js、サーバーはRailsで作成する。
- 単語の翻訳には「Google Cloud Translation API」を用いる。  
https://cloud.google.com/translate?hl=ja

# 環境構築
- dockerコマンドなどをenv.shにaliasとしてまとめてある。  
- web/configに別途「Cloud Translation API」より発行されたjsonファイルを配置する。その際、名前はgoogle-cloud.jsonにしておく。
- .env.sampleの.sampleを削除し、`CLOUD_PROJECT_ID`の値を書き換える。(google-cloud.json参照)
```
# ルートディレクトリで行う
$ sourse env.sh
$ build
$ rails db:create
$ up
```
