class Tweet < ApplicationRecord
    validates :contents, presence: true
    belongs_to :user
    has_many :likes, dependent: :destroy

    def retweets_for_me
        Tweet.where(original_tweet_id: self.id, retweeted: true)
    end
    def is_retweet?

        if self.retweeted == true && self.original_tweet_id.present?
            true
        else 
            false
        end 
    end
    
end