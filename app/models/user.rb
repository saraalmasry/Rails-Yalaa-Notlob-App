class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :usrs
  has_many :user_orders, dependent: :destroy
  has_many :friend_ships, dependent: :destroy
  acts_as_target
end
