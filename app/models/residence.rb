class Residence < ApplicationRecord
  belongs_to :user, optional: true

  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
