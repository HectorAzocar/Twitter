class AddUserToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :user, foreign_key: true
  end
end
