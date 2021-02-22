class TweetsController < ApplicationController
 
 
  def index

    @tweets = Tweet.page(params[:page]).per(50).includes(:tweet)

  end

  def new
    @tweet = Tweet.new

  end

  def show
    @users = User.all

  end
end
