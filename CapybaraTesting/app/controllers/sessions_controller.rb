class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      user_login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ['Invalid Username/Password Combination']
      redirect_to new_session_url
    end
  end
  
  def destroy
    user_logout
    redirect_to new_session_url
  end
end