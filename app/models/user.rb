class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :residence
  accepts_nested_attributes_for :residence
  has_many :items
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_one  :card

  validates :email, presence: true, uniqueness: true
  validates :name_kanji, presence: true
  validates :name_kana, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
