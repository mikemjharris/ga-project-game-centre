class UsersController < ApplicationController
  # layout "home"

  def index 
      @users = User.all
      @to_message_ids = current_user.messages.collect {|message| message.to_user_id}
      
  end

 
  def show
    @user = current_user
    @live_games = Ttt.live_games(@user.id)
  end

  def edit

  end


  def new
     @user = User.new
      render :layout => 'home'
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

  def scoreboard
    @user = User.find(params[:id])
    @games_vs_computer = Ttt.where(live_game: false, player_one_id: @user.id, computer: 1).count 
    @games_vs_computer_won = Ttt.where(live_game: false, player_one_id: @user.id, computer: 1, winner: 1).count 
    @games_vs_computer_lost = Ttt.where(live_game: false, player_one_id: @user.id, computer: 1, winner: 2).count 
    @games_vs_computer_drawn = Ttt.where(live_game: false, player_one_id: @user.id, computer: 1, winner: 0).count   
    
    @games_vs_player_two = Ttt.where(live_game: false, player_one_id: @user.id, player_two: nil, computer: nil).count 
    @games_vs_player_two_won = Ttt.where(live_game: false, player_one_id: @user.id, computer: nil, player_two: nil, winner: 1).count 
    @games_vs_player_two_lost = Ttt.where(live_game: false, player_one_id: @user.id, computer: nil, player_two: nil, winner: 2).count 
    @games_vs_player_two_drawn = Ttt.where(live_game: false, player_one_id: @user.id, computer: nil,player_two: nil, winner: 0).count   
    
    
    @games_vs_all = Ttt.where("(player_one_id = ? or player_two_id = ?) and live_game = ?", @user.id, @user.id, false).count
    @games_vs_all_won = Ttt.where("player_one_id = ? and winner = ?", @user.id, 1).count
    @games_vs_all_won += Ttt.where("player_two_id = ? and winner = ?", @user.id, 2).count
     @games_vs_all_lost = Ttt.where("player_one_id = ? and winner = ?", @user.id, 2).count
    @games_vs_all_lost += Ttt.where("player_two_id = ? and winner = ?", @user.id, 1).count
    @games_vs_all_drawn = Ttt.where("player_one_id = ? and winner = ?", @user.id, 0).count
    @games_vs_all_drawn += Ttt.where("player_two_id = ? and winner = ?", @user.id, 0).count


    @games_vs_user = @games_vs_all - @games_vs_player_two - @games_vs_computer
    @games_vs_user_won = @games_vs_all_won - @games_vs_player_two_won - @games_vs_computer_won
    @games_vs_user_lost = @games_vs_all_lost - @games_vs_player_two_lost - @games_vs_computer_lost   
    @games_vs_user_drawn = @games_vs_all_drawn - @games_vs_player_two_drawn - @games_vs_computer_drawn
   
    @live_games = Ttt.where("(player_one_id = ? or player_two_id = ?) and live_game = ?", @user.id, @user.id, true).count


   
    


    
  end


  def update 

  end


  def destroy

  end



end
