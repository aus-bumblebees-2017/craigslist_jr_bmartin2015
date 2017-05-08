class UsersController < ApplicationController
  def new
    if helpers.logged_in?
      redirect_to helpers.current_user
    else
      @user = User.new()
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      helpers.log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    if !helpers.logged_in?
      redirect_to login_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :email)
  end

end
