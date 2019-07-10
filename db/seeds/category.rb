lady = Category.create(name: "レディース")
lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_scart = lady.children.create(name: "スカート")
lady_onepiece = lady.children.create(name: "ワンピース")
lady_shoes = lady.children.create(name: "靴")
lady_room_wear = lady.children.create(name: "ルームウェア/パジャマ")
lady_leg_wear = lady.children.create(name: "レッグウェア")
lady_hat = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "鞄")
lady_accecary = lady.children.create(name: "アクセサリー")
lady_hear_accecary = lady.children.create(name: "ヘアアクセサリー")
lady_mini_item = lady.children.create(name: "小物")
lady_watch = lady.children.create(name: "時計")
lady_other = lady.children.create(name: "その他")
lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"ノーカラージャケット"}, {:name=>"レザージャケット"},{:name=>"その他"}])
lady_pants.children.create([{:name=>"ショートパンツ"}, {:name=>"ハーフパンツ"},{:name=>"その他"}])
lady_scart.children.create([{:name=>"ひざ丈スカート"}, {:name=>"キュロット"},{:name=>"その他"}])
lady_onepiece.children.create([{:name=>"ひざ丈ワンピース"}, {:name=>"ロングワンピース"},{:name=>"その他"}])
lady_shoes.children.create([{:name=>"ブーツ"}, {:name=>"スニーカー"},{:name=>"その他"}])
lady_room_wear.children.create([{:name=>"ルームウェア"}, {:name=>"パジャマ"},{:name=>"その他"}])
lady_leg_wear.children.create([{:name=>"スパッツ/レギンス"}, {:name=>"ソックス"},{:name=>"その他"}])
lady_hat.children.create([{:name=>"ハット"}, {:name=>"キャップ"},{:name=>"その他"}])
lady_bag.children.create([{:name=>"トートバッグ"}, {:name=>"リュック"},{:name=>"その他"}])
lady_accecary.children.create([{:name=>"ブレスレット"}, {:name=>"ネックレス"},{:name=>"その他"}])
lady_hear_accecary.children.create([{:name=>"ヘアバンド/カチューシャ"}, {:name=>"ヘアピン"},{:name=>"その他"}])
lady_mini_item.children.create([{:name=>"折り財布"}, {:name=>"長財布"},{:name=>"その他"}])
lady_watch.children.create([{:name=>"腕時計（デジタル）"}, {:name=>"腕時計（アナログ）"},{:name=>"その他"}])
lady_other.children.create([{:name=>"下着"}, {:name=>"コスプレ"},{:name=>"その他"}])
mens = Category.create(name: "メンズ")
mens_tops = mens.children.create(name: "トップス")
mens_jacket = mens.children.create(name: "ジャケット/アウター")
mens_pants = mens.children.create(name: "パンツ")
mens_suit = mens.children.create(name: "スーツ")
mens_shoes = mens.children.create(name: "靴")
mens_leg_wear = mens.children.create(name: "レッグウェア")
mens_hat = mens.children.create(name: "帽子")
mens_bag = mens.children.create(name: "鞄")
mens_accecary = mens.children.create(name: "アクセサリー")
mens_mini_item = mens.children.create(name: "小物")
mens_watch = mens.children.create(name: "時計")
mens_other = mens.children.create(name: "その他")
mens_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
mens_jacket.children.create([{:name=>"ノーカラージャケット"}, {:name=>"レザージャケット"},{:name=>"その他"}])
mens_pants.children.create([{:name=>"デニム/ジーンズ"}, {:name=>"ワークパンツ"},{:name=>"その他"}])
mens_suit.children.create([{:name=>"セットアップ"}, {:name=>"スーツジャケット"},{:name=>"その他"}])
mens_shoes.children.create([{:name=>"ブーツ"}, {:name=>"スニーカー"},{:name=>"その他"}])
mens_leg_wear.children.create([{:name=>"レッグウォーマー"}, {:name=>"ソックス"},{:name=>"その他"}])
mens_hat.children.create([{:name=>"ハット"}, {:name=>"キャップ"},{:name=>"その他"}])
mens_bag.children.create([{:name=>"トートバッグ"}, {:name=>"リュック"},{:name=>"その他"}])
mens_accecary.children.create([{:name=>"ブレスレット"}, {:name=>"ネックレス"},{:name=>"その他"}])
mens_mini_item.children.create([{:name=>"折り財布"}, {:name=>"長財布"},{:name=>"その他"}])
mens_watch.children.create([{:name=>"腕時計（デジタル）"}, {:name=>"腕時計（アナログ）"},{:name=>"その他"}])
mens_other.children.create([{:name=>"全て"}])