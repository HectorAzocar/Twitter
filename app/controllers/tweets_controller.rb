class TweetsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :set_tweet, only: %i[ show destroy ]

  def index

    @tweets = Tweet.page(params[:page]).per(50).includes(:tweet)

  end

  def new
    @tweet = Tweet.new

  end

  def show
    @users = User.all

  end

  def create
    @tweet = tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save

    redirect_to root_path
    
  end
  
  def destroy

end
