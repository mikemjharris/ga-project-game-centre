class UsersController < ApplicationController

  def index 
      @users = User.all
      @to_message_ids = current_user.messages.collect {|message| message.to_user_id}

  end
  def games


  end

 
  def show
    @user = current_user
    @live_games = Ttt.where('live_game = ? and player_one_id = ? or player_two_id = ?', true, @user.id, @user.id)
    

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
