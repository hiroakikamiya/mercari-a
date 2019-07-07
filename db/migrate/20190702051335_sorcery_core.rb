class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string    :email,            null: false
      t.string    :name_kanji,       null: false
      t.string    :name_kana,        null: false
      t.string    :nickname,         null: false
      t.date      :birthday,         null: false
      t.string    :phone_number,     null: false,unique: true
      t.text      :comment
      t.string    :crypted_password
      t.string    :salt
      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
  end
end
