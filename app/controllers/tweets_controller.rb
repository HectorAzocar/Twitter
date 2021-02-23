class TweetsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_tweet, only: %i[ show destroy ]

  def index
    @tweets = Tweet.order(created_at: :desc).page(params[:page]).per(50).includes(:tweet)
   
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
      @tweet.save

      if @tweet.save
        flash[:success] = "Se creo exitosamente el Tweet"
        redirect_to root_path
      else
        flash[:error] = "Algo paso, intentalo de nuevo"
        render 'new'
      end
  end

def retweet
  original_tweet = Tweet.find(params[:id])

  @retweet = Tweet.new(
    user_id: current_user.id,
    content: original_tweet.content)
  if @retweet.save
    redirect_to retweet_path, alert: ' Hiciste Retweet!'
  else
    redirect_to root_path, alert: ' No pudiste hacer retweet'
  end
end


  def destroy
      @tweet = Tweet.find(params[:id])
      if @tweet.destroy
          flash[:success] = 'El tweet fue borrado con exito.'
          redirect_to tweets_url
      else
          flash[:error] = 'algo paso, intentalo de nuevo'
          redirect_to tweets_url
      end
  end
  

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def retweet_params
  #   params.require(:retweet).permit(:retweet_id, :content).merge(user_id: current_user.id)
  # end
  def tweet_params
    params.require(:tweet).permit(:contents, :id_user, :tweet_id)
  end


end
