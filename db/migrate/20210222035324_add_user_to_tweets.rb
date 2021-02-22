class AddUserToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :user, foreign_key: true
  end
end
