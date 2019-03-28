class AddJoinedCulmn < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :joined, :integer, default: 0
  end
end
