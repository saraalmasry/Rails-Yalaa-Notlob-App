class Order < ApplicationRecord

  has_many :user_orders, dependent: :delete_all
  has_many :invited_friends, dependent: :delete_all
  has_many :notifications, dependent: :delete_all
  belongs_to :user 
end
