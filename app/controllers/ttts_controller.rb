class TttsController < ApplicationController

  def index

  end

  def show
    @ttt = Ttt.find(params[:id])

  end

  def edit

  end


  def new
    new_game = Ttt.new({:player_one_position => 0,
     :player_two_position => 0, 
     :live_game => true,
     :next_player =>  1,
     :computer => false
    })

    new_game.save

    redirect_to ttt_path(new_game)
  end

  def update

    @ttt = Ttt.find(params[:id]).make_move(params[:move])
    
    if @ttt.check_solution 
        @ttt.update_status
    end

      
    redirect_to ttt_path(@ttt)

  end

  def destroy

  end



end
