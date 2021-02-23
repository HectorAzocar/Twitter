class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :contents
      t.boolean :retweeted, default: :false
      t.integer :original_tweet_id

      t.timestamps
    end
  end
end