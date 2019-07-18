class Residence < ApplicationRecord
  belongs_to :user, optional: true

  validates :post_code, null: false
  validates :prefecture, null: false
  validates :city, null: false
  validates :address, null: false
end
