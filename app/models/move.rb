class Move < ActiveRecord::Base
  attr_accessible :player_move, :player, :ttt_id, :user_id

  belongs_to :ttt
  belongs_to :user

  validates :player, presence: true
  validates :player_move, presence: true
  validates :ttt_id, presence: true

  validate :player_move_valid 
  validate :no_winner
  validate :availiable_moves
  validate :player_valid
  
  private

  def player_move_valid
    errors.add(:base, "Already made that move")  if  player_moves.include?(self.player_move) 
  end  

  def player_moves
    Move.where(ttt_id: self.ttt_id).collect{|move| move.player_move}
  end

  def no_winner
    errors.add(:base, "Sorry - this game has finished") unless Ttt.find(self.ttt_id).live_game
  end
  
  def availiable_moves
    availiable_moves = (0...9).collect {|i| 2 ** i}
    errors.add(:base, "That isn't a square on the board.")  unless  availiable_moves.include?(self.player_move)     
  end

  def player_valid
      # last_move =  Move.where(ttt_id: self.ttt_id).order("created_at").last
      ttt = self.ttt

      if ttt.check_user_a_player?(self.user_id)
      #   unless ttt.player_two_id || ttt.computer
      #     errors.add(:base, "It's not your turn") if last_move.user_id == self.user_id
      #   end
      else
        errors.add(:base, "It's not your turn")    
      end

  end

end
