load "pessoa.rb"

class Professor < Pessoa
      attr_accessor :disciplina, :salario

      def initialize(nome = "", idade = 0,disciplina = "",salario = 0)
          super(nome,idade)
          @disciplina = disciplina
          @salario = salario
      end
end