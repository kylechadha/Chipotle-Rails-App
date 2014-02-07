class AuthsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user.authenticated?(params[:user][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{current_user.username}!"
      redirect_to orders_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to orders_path
  end
end