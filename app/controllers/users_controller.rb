class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    session[:user_id] = @user.id
    redirect_to '/'
  else
    render 'new'
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
