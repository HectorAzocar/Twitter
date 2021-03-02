class TweetsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_tweet, only: %i[ show destroy ]

  def index
    @tweets =Tweet.all.order(created_at: :desc).page(params[:page]).per(50)
  end
  

  def show
    @users = User.all

  end

  def new
    @tweet = Tweet.new
  end

  def create 
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id if current_user
    retweet_r = params[:tweet][:retweeted]
    tweet_id = params[:tweet][:id] 
    
    if retweet_r
      original_tweet_contents = Tweet.find(tweet_id).contents
      @tweet.retweeted = true
      @tweet.original_tweet_id = tweet_id
      @tweet.contents = original_tweet_contents
    end
    
    if @tweet.save
      flash[:alert] = "Se creo exitosamente"
      redirect_to root_path
    else
      flash[:alert] = "Algo paso, intentalo de nuevo"
      render 'new'
    end
  end
  

  def destroy
      @tweet = Tweet.find(params[:id])
      if @tweet.destroy
          flash[:alert] = 'El tweet fue borrado con exito.'
          redirect_to tweets_url
      else
          flash[:alert] = 'algo paso, intentalo de nuevo'
          redirect_to tweets_url
      end
  end
  
  def api
    @tweets = Tweet.all
    render json: @tweets.to_json(only: [:id, :contents])
  end

  private
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def tweet_params
    params.require(:tweet).permit(:contents, :id_user, :tweet_id)
  end
end