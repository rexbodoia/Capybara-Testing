class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?
  
  def current_user(user)
    return nil unless session[:session_token]
    @current_user ||=  User.find_by(session_token: session[:session_token])
  end
  
  def user_login!(user)
    
  end
  
  def logged_in?
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!current_user
  end
  
  
  def user_logout
    
  end
end
