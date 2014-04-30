class SessionsController < ApplicationController
  layout "home"

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id

          flash[:welcome] = "Welcome #{user.name}!"
      redirect_to root_url
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end

  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, notice: 'you have logged out'
  end



end
