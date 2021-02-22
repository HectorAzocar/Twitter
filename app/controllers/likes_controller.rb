class LikesController < ApplicationController

    before_action :find_tweet
    before_action :find_like, only: [:destroy]

    def index

    end

    def new

    end

    def chow

    end

    def create
    
    if already_liked?
        flash[:notice] = "ya le diste like"
      else
        @tweet.likes.create(user_id: current_user.id)
      end
      redirect_to root_path(@tweet)
    end

    def destroy
        if !(already_liked?)
          flash[:notice] = "no puedes like"
        else
          @like.destroy
        end
        redirect_to root_path(@tweet)
      end
end

