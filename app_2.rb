require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "*-------------------------------------------------*"
puts "| FLOUSTACK 2022 V2.3...NON MIS A JOUR            |"
puts "| Le but du jeu c'est de comprendre sans savoir ! |"
puts "*-------------------------------------------------*"

puts "Comment tu t'appelle gros batard ?"
player_name = gets.chomp.to_s
user_player = HumanPlayer.new(player_name)

player1 = Player.new("Lowlianne")
player2 = Player.new("elliG")

ennemies = [player1, player2]

while user_player.life_points > 0 && player1.life_points > 0 || player2.life_points > 0  
    user_player.show_state

    puts "Qu'es ce que tu fait alors, choisi ?"

puts "w - cherche du loot !"
puts "h - tu veux te soigner vieille peau ?" 

puts "\n =============== \n"

puts "attaque moi ce LOW :"
puts "0 - #{player1.show_state}"
puts "1 - #{player2.show_state}"

puts "\n =============== \n"

    puts "Faites votre choix "

puts "\n =============== \n"
    choice = gets.chomp.to_s
    case choice
        when "w"
            user_player.search_weapon
        when "h"
            user_player.health_pack
        when "0"
            user_player.attacks(player1)
        when "1"
            user_player.attacks(player2)
        else
            puts "t'es con ! pourquoi tu choisis autre chose que les choix proposés ?"
    end

    ennemies.each {|ennemy|
    if ennemy.life_points > 0
        puts "ces salopes osent t'attaquer !"
        ennemy.attacks(user_player)

    end}


end     

if user_player.life_points <= 0
  puts "putain tu t'es fait désosser par ces LOWS !!! "
else
  puts "T'as gagné... Heureusement pour ton cul parce que perdre contre des LOWS pareil aurait été une honte !"
end