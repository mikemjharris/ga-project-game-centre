class UsersController < ApplicationController
  # layout "home"

  def index 
      @users = User.all
      @to_message_ids = current_user.messages.collect {|message| message.to_user_id}
  end

  def challenges
      @users = User.all
      @to_message_ids = current_user.messages.collect {|message| message.to_user_id}

      @q = User.search(params[:q])
      @users = @q.result(distinct: true)

  end

    def update 
      
      @user = User.find(params[:id])
      # @user.image = params[:user][:image]
      
        if @user.update_attributes(params[:user])
           redirect_to root_path
        else
          render :edit
        end
      
    end

 
  def show
    @user = current_user

    
  end

   def games
    @user = current_user
    @games = Ttt.live_games(@user.id)
    @title = "Live"

    if params[:which_games]
       case params[:which_games]
          when "all"
            @games = current_user.games_played
            
            @title = "All"     
       end
       
    end     


    render 'games'
  end

  def edit
    @user = User.find(params[:id])
  end


  def new
     @user = User.new
      render :layout => 'home'
  end


  def create
    @user = User.new(params[:user])

      if @user.save
        session[:current_user_id] = @user.id
        redirect_to root_path, notice: "Welcome to the games portal!" 
      else
        render action: "new" , :layout => 'home'
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
    
    
    
    @live_games = Ttt.where("(player_one_id = ? or player_two_id = ?) and live_game = ?", @user.id, @user.id, true).count


   
    


    
  end





  def destroy

  end



end
