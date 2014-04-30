class TttsController < ApplicationController
  load_and_authorize_resource
  
  
  def index

  end

  def show
    @ttt = Ttt.find(params[:id])
     
  end

  def edit

  end


  def new
    @ttt = Ttt.new({:player_one => current_user,
     :next_player =>  1,
     :live_game => true
    })

    if params[:player_two]
      @ttt.player_two_id = params[:player_two].to_i
      Message.where(to_user_id: current_user.id, user_id: params[:player_two].to_i).each {|message| message.delete}
      Message.where(to_user_id: current_user.id, user_id: params[:player_two].to_i).each {|message| message.delete}
    end

    if params[:computer]
      @ttt.computer = true
    end

    @ttt.save
    redirect_to ttt_path(@ttt)
  end


  def update
    @ttt = Ttt.find(params[:id])
    redirect_to ttt_path(@ttt)
  end

  def destroy

  end




end
