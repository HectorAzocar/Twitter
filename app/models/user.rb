class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :tweets
  has_many :likes
  has_many :friends
  scope :tweets_for_me, ->(friends_ids) { Tweet.where(user_id: friends_ids) }

 # def tweets_for_me(Friends)
  #  filtro = Hash.new
  #  Friends.each do |f|
  #    if current_user.id = f.friends_id
  #      filtro.push(f.friend_id)
  #    end

  #    return filtro
  #  end
 # end
#end
  def is_friend_with(user)
    Friend.where(user_id: self.id, friend_id: user.id).present? 
  end
end
    



