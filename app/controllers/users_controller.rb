class UsersController < ApplicationController

  skip_before_action :check_authorization, only: [:new, :create]

  def new
	@user = User.new
  end

  def create
	
	@user = User.create(params.require(:user).permit(:username, :password, :password_confirmation))
	
	session[:user_id] = @user.id
	
	redirect_to '/'
	
  end
end
