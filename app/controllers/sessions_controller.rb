class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if User.authenticate(params[:session][:email], params[:session][:password])
      helpers.log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    helpers.log_out
    redirect_to root_path
  end

  def inspect
  end
end
