# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create(text: '新品、未使用品')
Status.create(text: '未使用に近い')
Status.create(text: '目立った傷や汚れなし')
Status.create(text: 'やや傷や汚れあり')
Status.create(text: '傷や汚れあり')
Status.create(text: '全体的に状態が悪い')

DeliveryDate.create(date: '1〜2日で発送')
DeliveryDate.create(date: '2〜3日で発送')
DeliveryDate.create(date: '4〜7日で発送')

DeliveryCost.create(type: '送料込み(出品者負担)')
DeliveryCost.create(type: '着払い(落札者負担)')



