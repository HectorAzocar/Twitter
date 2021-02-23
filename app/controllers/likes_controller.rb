class LikesController < ApplicationController
  before_action :find_tweet
  before_action :find_like, only: [:destroy]
  def index

  end

  def show

  end

  def new
  end

  def create
    if already_liked?
      flash[:notice] = "Puedes dar like solo una vez"
    else
      @tweet.likes.create(user_id: current_user.id)
    end
    redirect_to root_path(@tweet)
  end

  def edit
  end

  def update
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "No puedes sacar el like"
    else
      @like.destroy
    end
    redirect_to root_path(@tweet)
  end

  private 
  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
    
  end

  def find_like
    @like = @tweet.likes.find(params[:id])
 end
 
  def already_liked?
    Like.where(user_id: current_user.id, tweet_id:
    params[:tweet_id]).exists?
  end
  
end
