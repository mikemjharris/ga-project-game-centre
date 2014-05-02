class Numb < ActiveRecord::Base
  attr_accessible :s1, :s2, :s3, :s4, :s5, :s6, :s7, :s8, :s9, :s10,
   :s11, :s12, :s13, :s14, :s15, :s16, :user_id, :score
 
  def compare_two_board_layouts(nu2)
    result = true
    (1..16).each do |i|
        result = result && (self["s" + i.to_s] == nu2["s" + i.to_s])
    end 
    result
  end

  def compare_future_move(nu3)
      result = true
      result = true && self.compare_two_board_layouts(nu3.move("u"))

  end

   def move_up
    move("u")
  end
  def move_down
    move("d")
  end 

  def move_left
      move("l")
  end

  def move_right
      move("r")
  end

  def free_moves
    free = []
    (0..16).each do |j| 
      a = "s" + j.to_s
      if self[a] == 0
         free << a
       end  
    end
    free
  end

  def move(dir)

    (0..3).each do |j| 
      cells = []
      (0..3).each do |i|
        if dir == "l" || dir == "r"
            cells[i] = "s" + (i + 1 + (j * 4)).to_s
        else
            cells[i] = "s" + (j + 1 + (i * 4)).to_s
        end
      end

        if dir == "r" || dir == "d"
          cells.reverse!
        end
        
      unless self[cells[0]] == 0 && self[cells[1]] == 0 && self[cells[2]] == 0 && self[cells[3]] == 0
        until self[cells[0]] != 0 do
          self[cells[0]] = self[cells[1]]
          self[cells[1]] = self[cells[2]]
          self[cells[2]] = self[cells[3]]
          self[cells[3]] = 0
        end
        unless self[cells[1]] == 0 && self[cells[2]] == 0 && self[cells[3]] == 0 
          until self[cells[1]] != 0 do
            self[cells[1]] = self[cells[2]]
            self[cells[2]] = self[cells[3]]
            self[cells[3]] = 0
          end
          unless self[cells[2]] == 0 && self[cells[3]] == 0 
            until self[cells[2]] != 0 do
              self[cells[2]] = self[cells[3]]
              self[cells[3]] = 0
            end
          end
        end
      end

      if self[cells[0]] == self[cells[1]] && self[cells[0]] !=0 
        self[cells[0]] *= 2
        self.score += self[cells[0]]
        self[cells[1]] = self[cells[2]]
        self[cells[2]] = self[cells[3]]
        self[cells[3]] = 0
      end
      if self[cells[1]] == self[cells[2]] && self[cells[1]] !=0 
        self[cells[1]] *= 2
        self.score += self[cells[1]]
        self[cells[2]] = self[cells[3]]
        self[cells[3]] = 0  
      end
      if self[cells[2]] == self[cells[3]] && self[cells[3]] !=0 
        self.score += self[cells[2]]
        self[cells[2]] *= 2
        self[cells[3]] = 0
      end
    end 

  end




end
