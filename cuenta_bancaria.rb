class Usuario
    attr_accessor :nombre, :cuenta_bancaria
    def initialize(nombre, *cuenta_bancaria)
        @nombre = nombre
        @cuenta_bancaria = cuenta_bancaria
    end
    def saldo_total
        saldo_t = @cuenta_bancaria.map{|cuenta| cuenta.saldo}.sum 
        "El saldo de todas tus cuentas es de #{saldo_t}"
    end
end

class CuentaBancaria
    attr_accessor :banco, :numero_de_cuenta, :saldo
    def initialize(banco, numero_de_cuenta, saldo = 0)
        @banco = banco
        @numero_de_cuenta = numero_de_cuenta
        @saldo = saldo
    end

    def transferir(monto, cuenta_destino, cuenta_procedencia)
        @saldo = @saldo - monto
        cuenta_destino.saldo = cuenta_destino.saldo + monto
    end
end


cuenta1 = CuentaBancaria.new('Santander', '234-566', 5000)
cuenta2 = CuentaBancaria.new('BCI', '654-234', 5000)

cliente = Usuario.new('Deyna', cuenta1, cuenta2 )
puts cliente.saldo_total


puts cuenta1.saldo
cuenta1.transferir(5000, cuenta2, cuenta1)
puts cuenta1.saldo
puts cuenta2.saldo

