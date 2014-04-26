class Ttt < ActiveRecord::Base
  attr_accessible :computer, :live_game, :player_one, :player_one_position, :player_two, :player_two_position, :winner
end
