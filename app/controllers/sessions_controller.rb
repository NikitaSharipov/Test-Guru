class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:initial_path]
    else
      flash.now[:alert] = 'Are you a Guru? Verufy your Email and Password please'
      render :new
    end
  end

end
