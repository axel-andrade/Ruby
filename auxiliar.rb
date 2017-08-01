load "pessoa.rb"

class Auxiliar < Pessoa
      attr_accessor :cargo, :salario

      def initialize(nome = "", idade = 0, cargo = "",salario = 0)
          super(nome,idade)
          @cargo = cargo
          @salario = salario
      end
end