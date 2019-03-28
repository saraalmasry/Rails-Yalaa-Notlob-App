class AddUserDefaultImageUrl < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :image, 'https://www.autourdelacom.fr/wp-content/uploads/2018/03/default-user-image.png'
  end
end
