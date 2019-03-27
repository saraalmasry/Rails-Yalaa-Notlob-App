class Order < ApplicationRecord

  has_many :user_orders, dependent: :delete_all
  belongs_to :user 
end
