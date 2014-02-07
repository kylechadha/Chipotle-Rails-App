class AuthsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user.authenticates_with_password?(params[:user][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{current_user.name}!"
      redirect_to orders_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to orders_path
  end
end