class RenameType < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :type, :not_type
  end
end
