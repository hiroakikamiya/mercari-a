class Item < ApplicationRecord
  has_many :messages
  has_many :images
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_way
  belongs_to :delivery_date
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :seller, class_name: "User", foreign_key: :seller_id, optional: true
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id, optional: true
  belongs_to :prefecture
end
