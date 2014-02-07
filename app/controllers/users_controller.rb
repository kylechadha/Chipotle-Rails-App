#Questions
#1. Why is there no user.save like there is if order.save?

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :password))
    if @user.save
      redirect_to orders_new_path
    else
      render "new"
    end

  end

end
