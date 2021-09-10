class SessionsController < ApplicationController

  skip_before_action :check_authorization, only: [:new, :create]

  def new
  end

  def create
   user = User.find_by(username: params[:username])
   if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/welcome'
   else
      redirect_to '/login', alert: 'Invalid credentials'
   end
end

  def login
  end
  
  def destroy
	  session.delete(:user_id);
	  redirect_to '/welcome'
  end

  def welcome
	
  end
end
