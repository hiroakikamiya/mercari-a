class Item < ApplicationRecord
	has_many :messages
	has_many :images
	belongs_to :category
	belongs_to :status
	belongs_to :delivery_type
	belongs_to :delivery_date
	belongs_to :saler, class_name: "User"
	belongs_to :buyer, class_name: "User"
	belongs_to :prefecture_id
end
