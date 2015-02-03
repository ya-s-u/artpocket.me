# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

Category.create(:title => 'graphic', :title_ja => 'イラスト・グラフィック')
Category.create(:title => 'interior', :title_ja => '建築・インテリア・空間')
Category.create(:title => 'product', :title_ja => 'プロダクト・パッケージ')
Category.create(:title => 'degital', :title_ja => '写真・映像・デジタル')
Category.create(:title => 'fashion', :title_ja => 'ファッション')
Category.create(:title => 'installation', :title_ja => 'インスタレーション')
Category.create(:title => 'seminar', :title_ja => 'セミナー・講演会')
Category.create(:title => 'workshop', :title_ja => 'ワークショップ')
