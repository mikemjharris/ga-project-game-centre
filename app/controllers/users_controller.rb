class UsersController < ApplicationController

  def index

  end

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
        redirect_to root_path, notice: 'User was successfully created.' 
      else
        render action: "new" 
      end
  end

  def destroy

  end



end
