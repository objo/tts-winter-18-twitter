class UsersController < ApplicationController 
  before_action :authenticate_user!
  
  def profile
    @user = current_user
    @tweets = Tweet.where(user_id: current_user.following.push(current_user.id))
    @tweet = Tweet.new
  end
  
  def all
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users.to_json }
    end
  end
  
  def show
    @user = User.find(params['id'])
    @tweets = @user.tweets
    @tweet = Tweet.new
    render 'profile'
  end
  
  def follow
    unless current_user.following.include?(params['id'])
      current_user.following << params['id']
      current_user.save!
    end
    redirect_to user_path(params['id'])
  end
  
  def unfollow 
    current_user.following.delete(params['id'])
    current_user.save!
    redirect_to user_path(params['id'])
  end
end









