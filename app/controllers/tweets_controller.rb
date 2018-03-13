class TweetsController < ApplicationController
  
  def create
    @tweet = current_user.tweets.create(tweet_params)
    if @tweet.persisted?
      redirect_to users_profile_path
    else 
      @user = current_user 
      @tweets = Tweet.where(user_id: current_user.following.push(current_user.id))
      render 'users/profile'
    end
  end
  
  private 
  
  def tweet_params
    params.require(:tweet).permit(:message)
  end
  
end