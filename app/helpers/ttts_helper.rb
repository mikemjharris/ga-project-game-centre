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
   
    if @move.nil?
        return []
    elsif @move.errors.messages.any?
      return @move.errors.messages
    else 
      return []
    end
  end

  def winner_name(game)
    case game.winner
     when 0
        name = "Game tied." 
     when 1
      if game.player_one.name
        name = game.player_one.name.capitalize + " won"
      else 
        name = "Player one won"
      end
     when 2
      if game.player_two.nil?
        if game.computer
          name = "The computer won"
        else
          name = "Player two won"
        end
      else 
        name = game.player_two.name.capitalize + " won"
      end   
    end  
          
  end 

  def player_one
    if @ttt.player_one.name
      @ttt.player_one.name.capitalize
    else 
      "Player one"
    end
  end

  def player_two 
    if @ttt.player_two
      @ttt.player_two.name.capitalize
    elsif @ttt.computer
      "Computer"
    else
      "Player Two"
    end
  end

  def active_player(i)
      if @ttt.winner == i
          "player"
      else
          "player" if @ttt.next_player == i && @ttt.winner.nil?
      end
  end
end
