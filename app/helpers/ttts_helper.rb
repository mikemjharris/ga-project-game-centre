module TttsHelper

  def box_class(i)
      noughts = "%09b" % @ttt.player_one_position
      crosses = "%09b" % @ttt.player_two_position
      
      
      if noughts[i] == "1"
          return "nought"
      elsif crosses[i] == "1"
          return "cross"
      else 
          return "blank"
      end
  end



  def drawsymbol(box, position)
    if position < box
      return false
    elsif position % 2 == 1 
      return true
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
