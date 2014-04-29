module TttsHelper

  def box_class(i)
    noughts = @ttt.moves.where(player: 1).collect{ |move| move.player_move}
    crosses = @ttt.moves.where(player: 2).collect{ |move| move.player_move}

    if noughts.include?(2**(8-i)) 
        return "nought"
    elsif crosses.include?(2**(8-i)) 
        return "cross"
    else 
        return "blank"
    end
  end

  def errors
    if params[:errors].nil?
        return []
    else
      return params[:errors]
    end
  end

  def winner_name
    case @ttt.winner
     when 1
      if @ttt.player_one.name
        name = @ttt.player_one.name
      else 
        name = "Player one"
      end
     when 2
      if @ttt.player_two.nil?
        name = "Player two"
      else 
        name = @ttt.player_two.name
      end   
    end  
          
  end 


end
