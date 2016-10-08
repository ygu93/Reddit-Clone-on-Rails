class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    log_out!(@user) if @user
    redirect_to new_session_url

  end


  private
  def session_params
    params.require(:user).permit(:username, :password)
  end
end
