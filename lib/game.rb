
require 'pry'


class Game
    attr_accessor :current_player, :status, :Board, :players
  #TO DO : la classe a plusieurs : le  (égal à un objet Player), le  (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  def initialize
      @players_name = welcome
      
      @caseboard_hash = create_caseboard
      
      @status = "on-going"
      
      @current_player = @player_1
      
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  end


  def turn
      puts @caseboard_hash
      @choix = choice.downcase
      if @caseboard_hash["#{@choix}"] != " "
          puts "essaie une case vide."
      else @caseboard_hash("#{@choix}") = @player_value
      end
      
      puts "Voici le tableau:"
      puts @caseboard_hash

      end
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    





def welcome
    puts "bonjour! bienvenue sur le super jeu de morpion, le jeu le plus strategique du monde! quel est le nom du joueur 1?"
    puts "ton nom >"
    player_1_name = gets.chomp
    puts "super #{player_1_name}! maintenant donnes le nom du joueur 2!"
    puts "ton nom >"
    player_2_name = gets.chomp
    puts "c'est parti mon kiki! #{player_1_name}, tu va jouer avec les X et #{player_2_name} tu va jouer avec les O"
    return @players = [player_1_name, player_2_name]
end

def choice
    puts "vas-y, fais ton choix"
    puts "case >"
    return @choix = gets.chomp.downcase
    
end

def create_caseboard
    return @caseboard_hash = {"a1" =>" ", "b1" => " ", "c1" => " ", "a2" =>" ", "b2" => " ", "c2" => " ", "a3" =>" ", "b3" => " ", "c3" => " "}
end


new_game = Game.new
@status = "on-going"
new_game.turn
