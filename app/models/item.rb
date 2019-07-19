class Item < ApplicationRecord
  validates :name, presence: true
  validates :explain, presence: true
  validates :status_id, presence: true
  validates :category_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :delivery_date_id, presence: true
  validates :price, presence: true
  validates :prefecture_id, presence: true
  validates :seller_id, presence: true
  has_many :messages
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_way
  belongs_to :delivery_date
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :seller, class_name: "User", foreign_key: :seller_id, optional: true
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id, optional: true
  belongs_to :prefecture
  belongs_to :user,optional: true
end
