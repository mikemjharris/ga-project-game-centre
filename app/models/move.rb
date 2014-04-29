class Move < ActiveRecord::Base
  attr_accessible :player_move, :player, :ttt_id

  belongs_to :ttt


  

end
