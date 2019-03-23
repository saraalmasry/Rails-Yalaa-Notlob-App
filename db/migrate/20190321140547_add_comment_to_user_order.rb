class AddCommentToUserOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :user_orders, :comment, :text
  end
end
