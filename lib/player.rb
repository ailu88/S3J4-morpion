require './show'

class Player
    attr_reader :player_name, :player_value
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).

  
  def initialize(player_name_input, player_value_input)
      @player_name = player_name_input
      @player_value = player_value_input
    #TO DO : doit régler son nom et sa valeur
  end
end
