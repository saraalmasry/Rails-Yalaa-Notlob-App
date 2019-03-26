class AddStatusNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :status, :integer
  end
end
