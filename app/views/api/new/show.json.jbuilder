json.data do 
    json.user do 
        json.id @user_id
        json.content 
        json.like_id @like
        json.retweets @retweet
    end
end

