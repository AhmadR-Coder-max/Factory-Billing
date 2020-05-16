class Order < ApplicationRecord

  has_one :calculation
  belongs_to :user

end
