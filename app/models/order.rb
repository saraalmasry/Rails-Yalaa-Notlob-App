class Order < ApplicationRecord
  belongs_to :user , dependent: :destroy
end
