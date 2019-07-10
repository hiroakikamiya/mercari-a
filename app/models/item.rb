class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :images, optional: true
  has_many :messages
  belongs_to :prefecture
	belongs_to :category, dependent: :destroy
	belongs_to :status
	belongs_to :delivery_cost
	belongs_to :delivery_date
	belongs_to :delivery_way
	belongs_to :saler, class_name: "User"
	belongs_to :buyer, class_name: "User"
end
