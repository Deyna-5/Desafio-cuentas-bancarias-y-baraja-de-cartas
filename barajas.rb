require_relative 'cartas'

class Baraja
    attr_accessor :cartas

    def initialize
        pintas = ['C', 'D', 'E', 'T']
        numeros = [1,2,3,4,5,6,7,8,9,10,11,12,13]
        @cartas = numeros.map{|num| pintas.map{|pin| Carta.new(pin, num)}}.flatten
    end

    def barajar
        @cartas.shuffle
    end

    def sacar
        @cartas.pop
    end

    def repartir
        cartas5 = []
        5.times do
            cartas5.push (sacar) 
        end
        return cartas5
    end

end

baraja1 = Baraja.new
print baraja1.repartir