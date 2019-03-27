class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :restourant, :restaurant
  end
end






