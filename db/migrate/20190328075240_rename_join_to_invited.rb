class RenameJoinToInvited < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :join, :invited
  end
end
