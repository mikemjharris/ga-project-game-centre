class UsersController < ApplicationController

 
  def show
    

  end

  def edit

  end


  def new
     @user = User.new
  end


  def create
    @user = User.new(params[:user])

      if @user.save
        session[:current_user_id] = @user.id
        redirect_to root_path, notice: 'User was successfully created.' 
      else
        render action: "new" 
      end
  end

  def update 

  end


  def destroy

  end



end
