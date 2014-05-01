class MessagesController < ApplicationController

  def challenge
   
  end

  def index
    @to_messages = current_user.messages
    @from_messages = Message.where(to_user_id: current_user)

  end

  def show
    
  end

  def edit

  end
  def create
    @user = current_user
    @user_to = User.find(params[:user_id])
    title = "I challenge you to a game!"
    message = "I challenge you to a game at dawn"
    @user.messages.create(to_user: @user_to , message: message, title: title, read: false)
    redirect_to challenges_path(@user)
  end

  def new
    # @user = current_user
    # @user_to = User.find(params[:user_id])
    # message = "I challenge you to a game!"
    # @user.messages.create(to_user: @user_to , message: message, read: false)
    
  end


  def update
    
  end

  def destroy

    Message.find(params[:id].to_i).destroy

    redirect_to user_messages_path
  end

  def accept_challenge
     raise 
     redirect_to
  end



end
