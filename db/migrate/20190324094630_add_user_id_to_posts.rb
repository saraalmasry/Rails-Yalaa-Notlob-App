class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :type, :integer
  end
end
