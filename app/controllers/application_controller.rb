class ApplicationController < ActionController::Base
  
  before_action :check_authorization
  helper_method :current_user
  helper_method :logged_in?
  
  def hello
    render html: "Hello To-Do-App!"
  end
  
  def current_user
	User.find_by(id: session[:user_id])
  end
  
  def logged_in?
	!current_user.nil?
  end
  
  def check_authorization
   redirect_to '/login' unless logged_in?
  end
end
