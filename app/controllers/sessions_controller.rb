class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to login_path, alert: "Login Failed"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logged Out of Session"
  end
end