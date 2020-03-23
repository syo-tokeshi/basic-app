# ポートフォリオ名 : basic_app

# 掲示板アプリを想定して作りましたので、色んなユーザーが自由に書き込んだりそれに対してコメントしたり、本を推薦するアプリです。

# DEMO
<img width="1440" alt="スクリーンショット 2020-01-21 18 52 03" src="https://user-images.githubusercontent.com/54713809/72795899-bac2d580-3c81-11ea-9941-a9611bce952e.png">

# 特徴

# 高度な技術は使っていませんが、出来る知識の範囲内で楽しいアプリに仕上げました。gemはbootstrap,kaminari,i18n等を導入し、奇麗なデザインとページネーション機能、エラーメッセージの日本語化を行う。検索機能はransackを使わず正規表現で実現。認証機能は定番のdeviceを使わずに実装。

# Requirement

ruby '2.5.7'

gem 'rails', ' 5.2.1'

gem "bootstrap"

gem 'jquery-rails', '4.3.1'

gem 'kaminari'

gem 'rails-i18n', ' 5.1'

# githubのurlとherokuのurlです。

# heroku.url → https://fierce-reef-28276.herokuapp.com/

# Author

syo tokeshi
