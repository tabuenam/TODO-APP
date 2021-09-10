class ApplicationController < ActionController::Base
  
  def hello
    render html: "Hello To-Do-App!"
  end
end
