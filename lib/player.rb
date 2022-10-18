require 'pry'

class Player #on creer la classe Player pour savoir comment les joueurs vont se comporter
    attr_accessor :name, :life_points #on ecrit les nouveaux attribut de class donc name et life_points qui sont appelé par attr_accessor qui permettra de les passer en lecture et écriture

    def initialize(nom) #On ouvre une def initialize pour mettre en route le programme avec à l'intérieur de la parenthèse les variables qu'on voudra modifier ensuite dans différentes boites
        @name = nom #on vient appeler l'attribut :name avec un @name et ensuite = le nom de la variable entre parenthèse : @name = nom
        @life_points = 10 #ici on reprend l'attribut :life_points en @life_points, mais cette fois ci on connait déjà le nombre de point de vie qui est 10 : @life_points = 10
    end 

    def show_state #Catégorie qui permet de savoir où en est le personnage
        puts "#{@name}, il te reste que #{@life_points} points de vie" #pour ça on appel avec un #{} les @ créés avant
            
        if @life_points <= 0 #ici on va essayer de dire si la vie et inférieur ou égale 0 tu meurs !
            puts "#{@name}, il te reste #{@life_points} points de vie ! T'ES MORT"
            
        else @life_points > 0 #voici la ligne qui dit "si la vie qu'il te reste et supérieur à 0 t'es toujours en jeu mais fait gaffe"
            puts "Esquive, avant de mourir ! tu n'a plus que #{@life_points} points de vie"  
        end  
    end

    def get_damage(damage) #création de la méthode qui permet de faire baisser les points de vie
        @life_points -= damage #on va faire le calcul donc @life_points et égale à @life_points moins damage (variable créée pour la méthode) le -= permet d'éviter la répétition de @life_points = @life_points - damage
        puts "Il te reste maintenant #{@life_points} de vie après avoir pris #{damage} de dommage"
    end 


end
binding.pry
