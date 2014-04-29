class Move < ActiveRecord::Base
  attr_accessible :player_move, :player, :ttt_id

  belongs_to :ttt

  validate :player_move_valid 


  def player_move_valid
    errors.add(:base, "Already made that move")  if  self.player_moves.include?(self.player_move)

  end  

  def player_moves
    Move.where("ttt_id = ? ", self.ttt_id).collect{|move| move.player_move}
  end

  

end
