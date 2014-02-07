class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :password))
    if @user.save
      # redirect_to orders_new_path
      redirect_to root_path
    else
      render "new"
    end

  end

end
