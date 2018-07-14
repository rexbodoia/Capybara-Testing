class UsersController < ApplicationController
  
  def new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save!
      user_login!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
  
  def destroy
    user_logout!
    redirect_to users_url
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
