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
    @move = @ttt.moves.new
    @move.player_move = params[:move]
    @move.player = @ttt.next_player

    if @move.save
        @ttt.update_attributes(next_player: @ttt.player)
        @ttt.update_board
    end
      flash[:notice] = "Bad move - try againsgsrgw"
    
  #   if @ttt.check_user_valid(current_user) && @ttt.winner.nil?
  #     if @ttt.valid_move(params[:move])
  #       @ttt.moves.create(player_move: params[:move].to_i, player: @ttt.next_player) 
  #       @ttt.update_attributes(next_player: @ttt.player)
  #       @ttt.update_board
  #     else 
  #       flash[:notice] = "Bad move - try again"
  #     end
  #    else
  #       flash[:notice] = "It's not your turn - please wait"
  #    end     
    redirect_to ttt_path(@ttt, errors: @move.errors.messages)
  end


  def destroy

  end



end
