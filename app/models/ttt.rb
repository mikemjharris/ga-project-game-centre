class Ttt < ActiveRecord::Base
  require 'matrix'
  attr_accessible :computer, :live_game, :player_one, :player_one_position, 
    :player_two, :player_two_id, :player_two_position, :winner, :next_player

  validates :player_one_id, :presence => true
  validate :player_setup

  has_many :moves  

  belongs_to :player_one, class_name: 'User'
  belongs_to :player_two, class_name: 'User'

 
  
  def not_live
    where("live_game is false")
  end

  def player_setup
    errors.add(:base, "Can't have a computer player and player two") if self.computer && self.player_two_id
  end

    def self.live_games(user_id)
        where('ttts.live_game = ? and (ttts.player_one_id = ? or player_two_id = ?)', true, user_id, user_id)
    end
    
    def self.live_game(user_id1, user_id2)
      where('ttts.live_game = ? and ((ttts.player_one_id = ? and ttts.player_two_id = ?) or (ttts.player_one_id = ? and ttts.player_two_id = ?))', 
        true, user_id1, user_id2, user_id2, user_id1)    
    end

    def check_user_playing?(current_user_id)
      if self.player_one_id == current_user_id || self.player_two_id == current_user_id
        true
      end
    end

    def check_user_a_player?(current_user_id)
  
      if (self.player_one_id == current_user_id) && (self.player_two_id.nil?)
        return true
 
        case self.next_player 
          when 1
            return true if self.player_one_id == current_user_id
          when 2  
            return true if self.player_two_id == current_user_id
          else 
            return false
        end
      end
    end

    def player
      if self.next_player == 1
        return 2
      else
        return 1
      end 
    end

    def update_status(type)
      self.live_game = false
      if type == "win"
        self.winner = self.player
      else 
        self.winner = 0
      end
      self.save
    end

    def check_draw
      true if self.moves.count == 9
    end

    def update_board
      if self.check_solution 
        self.update_status("win")
      elsif self.check_draw
        self.update_status("draw")
      elsif self.computer && self.next_player == 2
        computer_move = self.computer_move
        self.moves.build(player_move: computer_move, player: 2, user_id: self.player_one_id) 
        self.next_player = 1
        self.save
         if self.check_solution 
          self.update_status("win")
        end  
      end
    end

    def computer_move
      free_squares = []
      (0...9).each {|i| free_squares << 2 ** i}
      self.moves.each {|move| free_squares.delete(move.player_move)}  
      result = [] 
      free_squares.each do |square|
          if check_solution(next_player = 2, move = square)
                result << square
          end
      end
      if result.any?
        result.sample
      else
        free_squares.sample
      end
    end



 
  def make_matrix(position_in_binary)
      size_of_grid = 3 
      Matrix.build(size_of_grid,size_of_grid) do |row, col| 
        position_in_binary[row * size_of_grid + col].to_i
      end
  end

  def check_row(position_matrix)
    (position_matrix * position_matrix.transpose).to_a.collect{|row| row.max}.index(3)
  end

  def check_column(position_matrix)
    (position_matrix.transpose * position_matrix).to_a.collect{|row| row.max}.index(3)
  end

  def check_diagonal(position_matrix)
    if position_matrix.trace == 3 
      return 0
    else 
      mirror_matrix = make_matrix("0010101000")
      if (position_matrix * mirror_matrix).trace == 3
        return 1
      end
    end
  end

  def player_one_moves
    self.moves.where(player: 1).collect {|move| move.player_move}
  end

  def player_two_moves
    self.moves.where(player: 2).collect {|move| move.player_move}
  end

  def valid_move(move)
    if self.player_one_moves.include?(move.to_i) || self.player_two_moves.include?(move.to_i)
      return false
    else
      return true
    end
  end  

  def check_solution(next_player = nil, move = 0)
    player_position = move
    if self.next_player == 2 
      self.moves.where(player: 1).each {|move| player_position += move.player_move}
    else
      self.moves.where(player: 2).each {|move| player_position += move.player_move}
    end 
    position_in_binary = ("%09b" % player_position)
    position_matrix = make_matrix(position_in_binary)
   
    if check_row(position_matrix) 
        return {:row => check_row(position_matrix)}
    elsif check_column(position_matrix)   
        return {:col => check_column(position_matrix)}
    elsif check_diagonal(position_matrix) 
        return {:diag => check_diagonal(position_matrix)}
    else 
        false
    end

  end

  def player_name
    
    if self.next_player == 1 && self.player_one
      return self.player_one.name
    elsif self.player_two
      return self.player_two.name
    end
  end
end
