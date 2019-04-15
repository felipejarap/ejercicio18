# Se tiene un array que contiene los números de una
#     ruleta.r = (1..10).to_a
# Se pide:
#     Crear una clase llamada Roulette.
#     Crear un método de instancia llamado play que reciba como argumento un número al  cual  se  está  apostando.
#     Luego debe tomar un valor -del array- al azar y compararlo con el número al cual se apostó.
#     Crear un método de instancia que:
#           Debe almacenar el número generado al azar en un archivo llamado roulette_history.txt
#           Si el número al cual se apostó corresponde al generado al azar entonces,
#           debe además almacenar ese número en un archivo llamado winners.txt
#           Crear un método que lea el archivo rouletter_history.txt
#           y retorne el valor que más ha generado la ruleta históricamente.


class Roulette
    def initialize()
        @ruleta = (1..10).to_a
    end
    @winner_number = 0
    def play(betting_number = 1, array = @ruleta)
        @winner_number = rand((array.first)..(array.last))
        if betting_number == @winner_number
            puts "Results: your number is #{betting_number} and the roulette picked #{@winner_number}.\nYou are a winner, yohooo!"
        else
            puts "Results: your number is #{betting_number} and the roulette picked #{@winner_number}.\nBetter luck next time, mate!"
        end
        add_roulette_history(betting_number)
    end
end

def add_roulette_history(betting_number)
    file = File.open('roulette_history.txt', 'a')
    file.puts "#{@winner_number}\n"
    file.close
    if @winner_number == betting_number
        file = File.open('winners.txt', 'a')
        file.puts "#{@winner_number}\n"
        file.close
    end
end

def history_mode
    file = File.open('roulette_history.txt', 'r')
    data = file.readlines.map(&:to_i)
    file.close
    frequency = data.inject(Hash.new(0)) do |k,v|
        k[v] += 1; k 
    end
    max_number = data.max_by do |v|
        data.count(v)
    end
    puts "The most repeated number is #{max_number}"
end

game = Roulette.new
game.play(5)
game.play(5)
game.play(5)
history_mode