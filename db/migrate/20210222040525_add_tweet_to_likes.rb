class AddTweetToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :tweet, foreign_key: true
  end
end
