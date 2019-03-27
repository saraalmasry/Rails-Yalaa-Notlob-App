class UserOrder < ApplicationRecord
  # belongs_to :order  , dependent: :delete
  belongs_to :user 
end
