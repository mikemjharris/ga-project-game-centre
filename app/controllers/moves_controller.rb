class MovesController < ApplicationController
  
  # load_and_authorize_resource

  def show
    
  end

  def edit

  end


  def new

  end


  def update
  end

  def create 
    @ttt = Ttt.find(params[:ttt_id])
    @move = @ttt.moves.build(player_move: params[:player_move],
                              player: @ttt.next_player, user_id: current_user.id)
    # authorize! :create, @move, :message => "You can't make a move on someone elses game"
    
    # if @ttt.check_user_valid?(current_user)
        
        
      if @move.save
        @ttt.update_attributes(next_player: @ttt.player)
        @ttt.update_board 
        redirect_to ttt_path(@ttt)
      else 
        render '/ttts/show'
      end
    # else 
    #     flash[:notice] = "You've not a player in this game"
    #     render '/ttts/show'
    # end
  end

  def destroy

  end



end
