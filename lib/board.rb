require './show'
require './player'
require './game'
require 'pry'
class Board
    attr_accessor :caseboard_hash


  def initialize
      return @caseboard_hash = {"a1" =>" ", "b1" => " ", "c1" => " ", "a2" =>" ", "b2" => " ", "c2" => " ", "a3" =>" ", "b3" => " ", "c3" => " "}
      end
  
  end

