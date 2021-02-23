class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :tweets
  has_many :likes
  
  def tweets_for_me(friends)
    filtro = Hash.new
    friends.each do |f|
      if current_user.id = f.friends_id 
        filtro.push(f.friend_id)
      end
      return filtro
    end
end
end


