class Residence < ApplicationRecord
  belongs_to :user, optional: true
end
