class MovesController < ApplicationController

 
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
    
    if @ttt.check_user_valid(current_user)
      @move = @ttt.moves.new
      @move.player_move = params[:move]
      @move.player = @ttt.next_player

      if @move.save
        @ttt.update_attributes(next_player: @ttt.player)
        @ttt.update_board 
        redirect_to ttt_path(@ttt)
      else 
        render '/ttts/show'
      end
    else 
        flash[:notice] = "You've not a player in this game"
        render '/ttts/show'
    end
  end

  def destroy

  end



end
