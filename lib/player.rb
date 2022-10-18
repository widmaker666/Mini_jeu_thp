require 'pry'

class Player #on creer la classe Player pour savoir comment les joueurs vont se comporter
    attr_accessor :name, :life_points #on ecrit les nouveaux attribut de class donc name et life_points qui sont appelé par attr_accessor qui permettra de les passer en lecture et écriture

    def initialize(nom) #On ouvre une def initialize pour mettre en route le programme avec à l'intérieur de la parenthèse les variables qu'on voudra modifier ensuite dans différentes boites
        @name = nom #on vient appeler l'attribut :name avec un @name et ensuite = le nom de la variable entre parenthèse : @name = nom
        @life_points = 10 #ici on reprend l'attribut :life_points en @life_points, mais cette fois ci on connait déjà le nombre de point de vie qui est 10 : @life_points = 10
    end 

    def show_state #Catégorie qui permet de savoir où en est le personnage
                  
        if @life_points <= 0 #ici on va essayer de dire si la vie et inférieur ou égale 0 tu meurs !
            puts "#{@name}, il te reste #{@life_points} points de vie ! T'ES MORT"
            
        else @life_points > 0 #voici la ligne qui dit "si la vie qu'il te reste et supérieur à 0 t'es toujours en jeu mais fait gaffe"
            puts "tu n'a plus que #{@life_points} points de vie"  
        end  
    end

    def compute_damage #création d'une méthode pour lancer un dé aléatoirement
        return rand(1..6) #Pourquoi un return ... bonne question ... au lieu d'explquer dans le cours on fait un copier coller dixit le cours ! SUPER METHODE D'APPRENTISSAGE !
    end

    def get_damage(damage) #création de la méthode qui permet de faire baisser les points de vie
        @life_points -= damage #on va faire le calcul donc @life_points et égale à @life_points moins damage (variable créée pour la méthode) le -= permet d'éviter la répétition de @life_points = @life_points - damage
        puts "Il te reste maintenant #{@life_points} de vie après avoir pris #{damage} de dommage"
    end 

    def attacks(player)#on créer une méthode attack pour créer des dégats aléatoirs et que un player1 tape sur player2.
        
        puts "Le joueur 1 \"#{@name}\" mets un coup d'épée à \"#{player.name}\" !" #JE NE COMPREND PAS DU TOUT LE .NAME .... ça doit vouloir dire on applique le nom créé lorsqu'on créer un nouveau joueur
        damage = compute_damage #on va créer un variable pour mettre la méthode compute_damage (qui jette un dès au hasard entre 1 et 6) et qu'on pourra rappeler pour l'appliquer à la méthode get_damage
        puts "le joueur 2 \"#{player.name}\" vient de prendre #{damage} points de dommage!" #JE COMPREND PAS POURQUOI LE .NAME TOUJOURS ! COURS DE MERDE
        player.get_damage(damage)
        player.show_state
        #on applique les méthode get_damage et show_state à la variable de attacks : player.get_damage (pour compter les dommages) et player.show_state (pour vérifier où on en est des PV)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level, :name

    def initialize (human_name)
        @name = human_name   
        @life_points = 100
        @weapon_level = 1
    end
    
    def show_state 
    puts "#{@name}, il te reste #{@life_points} points de vie et ton arme est au level #{@weapon_level} ! "
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end
   
    def search_weapon
        new_weapon = rand(1..6)

       if new_weapon == 1
        puts "LVL de l'arme trouvé est #{new_weapon}, ça ne sert à rien de t'encombrer !"
       elsif new_weapon == 2 || new_weapon == 3 || new_weapon == 4
        puts "Tu viens de trouver une arme de LVL: #{new_weapon}"
        puts "récupère là et ajoute là tout de suite à ton équipement"
        @weapon_level = new_weapon  
       else new_weapon <= 5
        puts "Arme légendaire de niveau #{new_weapon} ! NE LA PERD PAS" 
        @weapon_level = new_weapon     
       end
    end

    def health_pack
        pack_life = rand(1..6)

        if pack_life == 1
            puts "désoler pour toi mais y'a pas de vie ici..."
        elsif pack_life >= 2 && pack_life <= 5
            puts "+50 PV... Remet toi de tes blessures"
            @life_points += 50
            
        else pack_life == 6 
            puts "+80 PV... Woow BONUS LIFE"
            @life_points += 80     
        end
        @life_points = 100 if @life_points > 100
    end
end



        
    



