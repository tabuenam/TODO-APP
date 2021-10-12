class UsersController < ApplicationController

  skip_before_action :check_authorization, only: [:new, :create]

  def new
	@user = User.new
  end

  def create
	  @user = User.create(params.require(:user).permit(:username, :password, :password_confirmation))
    if @user.save then
	    session[:user_id] = @user.id
	    redirect_to '/'
    else	    
	    redirect_to '/users/new?', alert: 'Please check your input: Username and password must not be empty, password must match confirmation.'
    end
  end
 
 end
