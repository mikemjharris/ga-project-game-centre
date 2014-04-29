class Move < ActiveRecord::Base
  attr_accessible :player_move, :player, :ttt_id

  belongs_to :ttt

  validate :player_move_valid 
  validate :no_winner
  validate :availiable_moves
  validate :check_user

  def player_move_valid
    errors.add(:base, "Already made that move")  if  self.player_moves.include?(self.player_move) 
  end  

  def player_moves
    Move.where(ttt_id: self.ttt_id).collect{|move| move.player_move}
  end

  def no_winner
    errors.add(:base, "There is already a winner") unless Ttt.find(self.ttt_id).winner.nil?
  end
  
  def availiable_moves
    availiable_moves = (0...9).collect {|i| 2 ** i}
    errors.add(:base, "That isn't a square on the board.")  unless  availiable_moves.include?(self.player_move)     
  end

  def check_user
    ttt =  Ttt.find(self.ttt_id)
    unless ttt.player_one == current_user || ttt.player_two == current_user 
      errors.add(:base, "Not a valid user")
    end
  end

end
