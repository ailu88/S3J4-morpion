require './board'
require './game'
require 'pry'
class Show

  def show_board
      puts "    A    B    C"
      puts "  ----------------"
      puts "1 |#{caseboard_hash['a1']}|#{caseboard_hash['b1']}|#{caseboard_hash['c1']}|"
      puts "  ----------------"
      puts "1 |#{caseboard_hash['a2']}|#{caseboard_hash['b2']}|#{caseboard_hash['c2']}|"
      puts "  ----------------"
      puts "1 |#{caseboard_hash['a3']}|#{caseboard_hash['b3']}|#{caseboard_hash['c3']}|"
      puts "  ----------------"
  end

  
  
end



