# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

Category.create(:title => 'graphic', :title_ja => 'イラスト・グラフィック')
Category.create(:title => 'architecture', :title_ja => '建築・インテリア')
Category.create(:title => 'media', :title_ja => '写真・映像・メディア')
Category.create(:title => 'fashion', :title_ja => 'ファッション・クラフト')
