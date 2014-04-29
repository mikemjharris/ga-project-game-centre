class TttsController < ApplicationController

  def index

  end

  def show
    @ttt = Ttt.find(params[:id])
  end

  def edit

  end


  def new
    new_game = Ttt.new({:player_one => current_user,
      :player_two_id => params[:player_two].to_i,
     :next_player =>  1,

    })

    if params[:computer]
      new_game.computer = true
    end

    new_game.save
    redirect_to ttt_path(new_game)
  end


  def update
    @ttt = Ttt.find(params[:id])
    redirect_to ttt_path(@ttt)
  end

  def destroy

  end

  

end
