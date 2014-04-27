class Ttt < ActiveRecord::Base
  require 'matrix'
  attr_accessible :computer, :live_game, :player_one, :player_one_position, 
    :player_two, :player_two_position, :winner, :next_player


    def update_status

        self.live_game = false
        if self.next_player == 1
          self.winner = 2
        else
          self.winner = 1
        end
        self.save

    end



    def make_move(move)
      if self.next_player == 1 
        self.player_one_position += move.to_i
        self.next_player = 2
      else   
        self.player_two_position += move.to_i
        self.next_player = 1
      end
        self.save
        self
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

  def check_solution
    if self.next_player == 2 
      player_position = self.player_one_position
    else
      player_position = self.player_two_position
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
end
