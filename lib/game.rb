class Game
    attr_accessor :current_player
    
  def initialize #innitialize! le truc commence! c'est le truc qui fait marcher Game.new
      @caseboard_hash = create_caseboard #on créé un hash de toutes les cases d'abbord, pour pouvoir show le board à la ligne 23
      welcome
      @current_player = @player_1
      @player_value = "X"
  end
  
  def welcome #demande le nom des jouers et affiche le board vide
      puts "bonjour! Bienvenue sur le super jeu de morpion, le jeu le plus stratégique du monde! Quel est le nom du joueur 1?"
      puts "Ton nom >"
      @player_1 = gets.chomp #entre ton nom et maintenant @player_1 est = à ton nom!
      puts "Super, #{@player_1}! Maintenant, donne le nom du joueur 2!"
      puts "Ton nom >"
      @player_2 = gets.chomp
      puts "C'est parti mon kiki! #{@player_1}, tu vas jouer avec les X et #{@player_2} tu vas jouer avec les O"
      system 'clear' #c'est pour que tu vois le jeu mieux
      show_board
  end
  
  
  def choice #on fait appel à cette fonction à chaque fois que tu veux faire ton choix
      puts "#{@current_player} vas-y, fais ton choix"
      puts "Case >"
      return gets.chomp.downcase #au cas où tu décided de faire un A1 au lieu d'un a1
  end
  
  def create_caseboard
      return @caseboard_hash = {"a1" =>" ", "b1" => " ", "c1" => " ", "a2" =>" ", "b2" => " ", "c2" => " ", "a3" =>" ", "b3" => " ", "c3" => " "} #c'est pour faire appel à des keys et des values plus facilement
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

  def turn #quand tu fais ton choix, cette methode update le hash avec la nouvelle valeur
      choix = choice
      if @caseboard_hash["#{choix}"] != " "
          puts "essaie une case vide."
          turn
      else @caseboard_hash["#{choix}"] = @player_value
      end
      show_board
  end


  def change_player #le joureur change et son value change aussi à chaque tour
    if @current_player == @player_1
        @current_player = @player_2
        @player_value = "0"
        else
        @current_player = @player_1
        @player_value = "X"
    end
  end

def victory_message
    puts "PARTIE FINIE !!! Bravo #{@current_player}, tu es une véritable star de la stratégie!"
    end

def null_message
    puts "MATCH NUL ! Fin de la partie. Vous êtes tous les deux aussi nuls, impossible de vous départager !"
end

def check_if_victory #les conditions pour gagner
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


def check_if_null #la condition qui défini si la partie est nul
    if @caseboard_hash.has_value?(" ") == false
    return true
    else return false
    end
end

def check_if_game_finished #lance le message correcte en fonction de si la partie est gagnée ou est null
    if check_if_victory == true
        victory_message
        elsif check_if_null == true
        null_message
        else
        return false
    end
end


end
#la classe est fini, maintenenat on lance le jeu
new_game = Game.new
new_game.turn

#cette boucle fait en sorte que le jeu continue jusqu'au game finished (change le player et update la hash avec son choix)
while new_game.check_if_game_finished == false
    new_game.change_player
    new_game.turn
end
