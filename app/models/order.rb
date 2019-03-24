class Order < ApplicationRecord

  has_many :user_orders, dependent: :destroy
  belongs_to :user 
end
