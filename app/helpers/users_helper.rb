module UsersHelper

  def message_from(user1, user2)

    Message.where(user_id: user1 , to_user_id: user2)

  end


  def live_game(game)

      if game.computer 
        return "You vs the computer"
      elsif game.player_two  
        if game.player_one == current_user 
          return "You vs " +  game.player_two.name.capitalize
        else
          return game.player_one.name.capitalize + " vs you"
        end
      else 
          return "You vs Player Two"
      end
  end

  def nos_live_games
      Ttt.where("(player_one_id = ? or player_two_id = ?) and live_game = ?", current_user.id, current_user.id, true).count
  end


  def live_games
     Ttt.where("(player_one_id = ? or player_two_id = ?) and live_game = ?", current_user.id, current_user.id, true).count
  end

  def challenges
    Message.where(to_user_id: 1)
  end  


end