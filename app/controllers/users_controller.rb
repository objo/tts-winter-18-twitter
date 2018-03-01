class UsersController < ApplicationController 
  
  def profile
    @user = User.first
  end

end