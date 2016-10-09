class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to subs_url
    else
      render :new
    end
  end

  def show
    @user= User.find_by_id(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
