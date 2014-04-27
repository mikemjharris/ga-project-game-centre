require 'matrix'

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


  require 'matrix'
  def make_matrix(position_in_binary)
      size_of_grid = 3 
      Matrix.build(size_of_grid,size_of_grid) do |row, col| 
        position_in_binary[row * size_of_grid + col].to_i
      end
  end

  def check_if_column(player_position)
    position_in_binary = "%08b" % player_position
    position_matrix = make_matrix(posiiton_in_binary)

    (positon_matrix * position_matrix.transpose).to_a.collect{|row| row.max}.index(3)

  end

  puts check_if_column(1)
  puts check_if_column(2)
  puts check_if_column(4)
  puts check_if_column(7)

