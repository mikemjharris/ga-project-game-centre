require 'matrix'
require 'pry'
# def makematrix(b)
#     Matrix.build(4,4) {|row, col| b[row * 4 + col].to_i}
# end


def print_nos
   id = makematrix("000110000")
   all = [7,15,511]
   # all.each do |i|
   (0..512).each do |i|
    space = ""
    a = i.to_s(2)
    (16 - a.length).times {space << "0"}
    space << a
    
    
      b = makematrix(space)
      ok = (b * b.transpose).to_a.collect{|row| row.max}.include?(4)
      if ok 
        puts b
      end

    # print b.diagonal?
    # print " "
    # print b * b.transpose
    # puts (b * b.transpose).to_a.collect{|row| row.max}.include?(3)

    # puts (b * )
  end

  x = ["100100100", "010010010", "001001001"]
  x.each do |y|
    print b = makematrix(y)
    print "  "
    puts b.transpose * b
    print id
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

  def check_solution(player_position)
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


puts check_solution(7)
puts check_solution(73)
puts check_solution(273)
puts check_solution(84)

