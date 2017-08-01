load "pessoa.rb"

class Aluno < Pessoa
	attr_accessor :curso,:matricula #gets e sets

	def initialize(nome = "", idade = 0 , curso = "", matricula = 0)
		super(nome,idade)
		@curso = curso
		@matricula = matricula
    end

end

