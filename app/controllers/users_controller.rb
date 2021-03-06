class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      # redirect_to orders_new_path
      redirect_to root_path
    else
      render "new"
    end

  end

end
