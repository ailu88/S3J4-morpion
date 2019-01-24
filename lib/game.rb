require 'pry'


class Game
    attr_accessor :current_player, :status, :Board, :players
  #TO DO : la classe a plusieurs : le  (égal à un objet Player), le  (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  def initialize
      @players_name = welcome
      
      @caseboard_hash = create_caseboard
      
      @status = "on-going"
      
      @current_player = @player_1
      @player_value = "X"
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  end
  
  def welcome
      puts "bonjour! bienvenue sur le super jeu de morpion, le jeu le plus strategique du monde! quel est le nom du joueur 1?"
      puts "ton nom >"
      @player_1 = gets.chomp
      puts "super #{@player_1}! maintenant donnes le nom du joueur 2!"
      puts "ton nom >"
      @player_2 = gets.chomp
      puts "c'est parti mon kiki! #{@player_1}, tu va jouer avec les X et #{@player_2} tu va jouer avec les O"
  end
  
  def choice
      puts "#{@current_player} vas-y, fais ton choix"
      puts "case >"
      return gets.chomp.downcase
      
  end
  
  def create_caseboard
      return @caseboard_hash = {"a1" =>" ", "b1" => " ", "c1" => " ", "a2" =>" ", "b2" => " ", "c2" => " ", "a3" =>" ", "b3" => " ", "c3" => " "}
  end
  def show_board
      puts "     A     B     C"
      puts "  ------------------"
      puts "1 |  #{@caseboard_hash['a1']}  |  #{@caseboard_hash['b1']}  |  #{@caseboard_hash['c1']}  |"
      puts "  ------------------"
      puts "2 |  #{@caseboard_hash['a2']}  |  #{@caseboard_hash['b2']}  |  #{@caseboard_hash['c2']}  |"
      puts "  ------------------"
      puts "3 |  #{@caseboard_hash['a3']}  |  #{@caseboard_hash['b3']}  |  #{@caseboard_hash['c3']}  |"
      puts "  ------------------"
  end

  def turn
      choix = choice
      if @caseboard_hash["#{choix}"] != " "
          puts "essaie une case vide."
      else @caseboard_hash["#{choix}"] = @player_value
      end
      
      #puts "Voici le tableau:"
      #puts @caseboard_hash
      show_board

      end


def change_player
    if @current_player == @player_1
        @current_player = @player_2
        @player_value = "0"
        else
        @current_player = @player_1
        @player_value = "X"
        end
    end

def victory_message
    puts "PARTIE FINIE !!!! bravo #{@current_player}"
    end

def null_message
    puts "MATCH NUL ! fin de la partie."
end

def check_if_victory
    if @caseboard_hash["a1"] == @caseboard_hash["b1"] && @caseboard_hash["a1"] == @caseboard_hash["c1"] && @caseboard_hash["a1"] != " "
    return true
    elsif @caseboard_hash["a2"] == @caseboard_hash["b2"] && @caseboard_hash["a2"] == @caseboard_hash["c2"] && @caseboard_hash["a2"] != " "
    return true
    elsif @caseboard_hash["a3"] == @caseboard_hash["b3"] && @caseboard_hash["a3"] == @caseboard_hash["c3"] && @caseboard_hash["a3"] != " "
    return true
    elsif @caseboard_hash["a1"] == @caseboard_hash["a2"] && @caseboard_hash["a3"] == @caseboard_hash["a1"] && @caseboard_hash["a2"] != " "
    return true
    elsif @caseboard_hash["b1"] == @caseboard_hash["b2"] && @caseboard_hash["b3"] == @caseboard_hash["b1"] && @caseboard_hash["b2"] != " "
    return true
    elsif @caseboard_hash["c1"] == @caseboard_hash["c2"] && @caseboard_hash["c3"] == @caseboard_hash["c1"] && @caseboard_hash["c2"] != " "
    return true
    elsif @caseboard_hash["a1"] == @caseboard_hash["b2"] && @caseboard_hash["c3"] == @caseboard_hash["a1"] && @caseboard_hash["c3"] != " "
    return true
    elsif @caseboard_hash["c1"] == @caseboard_hash["b2"] && @caseboard_hash["a3"] == @caseboard_hash["c1"] && @caseboard_hash["a3"] != " "
    return true
    else return false
    end
end


def check_if_null
    if @caseboard_hash.has_value?(" ") == false
    return true
    else return false
    end
end

def check_if_game_finished
    if check_if_victory == true
        victory_message
        elsif check_if_null == true
        null_message
        else
        return false
    end
end


end
    
new_game = Game.new
new_game.turn
while new_game.check_if_game_finished == false
    new_game.change_player
    new_game.turn
end


        
