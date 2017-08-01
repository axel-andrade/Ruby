
load "aluno.rb"
load "professor.rb"
load "auxiliar.rb"
load "cadastro.rb"


criar_tabelas()

begin #comeco do while

	print "Opcoes\n\n1-Cadastrar\n2-Ler\n3-Editar\n4-Remover\n0-Sair\n\nDigite a opcao: "

	opcao = gets()

	case opcao.to_i()
	  when 1
          system ("clear")
          print "Cadastrar\n\n1-Aluno\n2-Professor\n3-Auxiliar\n0-Voltar\n\nDigite a opcao: "

              opcao2 = gets()

              case opcao2.to_i()
                when 1
				      print "Digite o nome do aluno: " 
				      nome = gets.chomp #chomp evitar que o gest pegue o \n no final da leitura
				      print "Digite a idade: "
				      idade = gets.chomp
				      print "Digite o curso: "
				      curso = gets.chomp
				      print "Digite a matricula: "
				      matricula = gets.chomp
	          
			          #criando as variaveis 
			          obj_aluno = Aluno.new(nome,idade.to_i(),curso,matricula.to_i())
			          #inserindo no banco
			          inserir_dados(obj_aluno,1)

			    when 2  
			    	  print "Digite o nome do professor: " 
				      nome = gets.chomp #chomp evitar que o gest pegue o \n no final da leitura
				      print "Digite a idade: "
				      idade = gets.chomp
				      print "Digite a disciplina: "
				      disciplina = gets.chomp
				      print "Digite o salario: "
				      salario = gets.chomp
	          
			          #criando as variaveis 
			          obj_prof = Professor.new(nome,idade.to_i(),disciplina,salario.to_f())
			          #inserindo no banco
			          inserir_dados(obj_prof,2)
			    when 3
			    	  print "Digite o nome do auxiliar: " 
				      nome = gets.chomp #chomp evitar que o gest pegue o \n no final da leitura
				      print "Digite a idade: "
				      idade = gets.chomp
				      print "Digite o cargo: "
				      cargo = gets.chomp
				      print "Digite o salario: "
				      salario = gets.chomp
	          
			          #criando as variaveis 
			          obj_aux = Auxiliar.new(nome,idade.to_i(),cargo,salario.to_f)
			          #inserindo no banco
			          inserir_dados(obj_aux,3)

			    else 
			    	puts "voltando ..."
                
                end

	  when 2
		  	system ("clear")
		  	print "Visualizar\n\n1-Aluno\n2-Professor\n3-Auxiliar\n4-Todos\n0-Voltar\n\nDigite a opcao: "

		  	opcao2 = gets()

		  	case opcao2.to_i()
		  	when 1
		  		    system ("clear")
				  	puts "Alunos"
				    visualizar_dados(1)

			when 2
				    system ("clear")
			   	    puts "Professores"
				    visualizar_dados(2)

			when 3 
				    system ("clear")
			   	    puts "Auxiliares"
				    visualizar_dados(3)
		    when 4 
		    	    system ("clear")
				  	puts "Alunos"
				    visualizar_dados(1)
				    puts "Professores"
				    visualizar_dados(2)
				    puts "Auxiliares"
				    visualizar_dados(3)

		    else 
		    	 break

		    end

	  when 3
		  	system ("clear")
	        
	        print "Atualizar\n\n1-Aluno\n2-Professor\n3-Auxiliar\n0-Voltar\n\nDigite a opcao: "

			opcao2 = gets()

			case opcao2.to_i()
			  when 1 
			  	print "Digite o id do aluno para mudança de curso: "
			  	id = gets.chomp
			  	print "Digite o novo curso: "
			  	novo_curso = gets.chomp

			  	atualizar_dados(novo_curso,id.to_i(),1)

			  when 2 
			  	print "Digite o id do professor para mudança de disciplina: "
			  	id = gets.chomp
			  	print "Digite a nova disciplina: "
			  	novo_disciplina = gets.chomp

			  	atualizar_dados(novo_disciplina,id.to_i(),2)

			  when 3 
			  	print "Digite o id do auxiliar para mudança de cargo: "
			  	id = gets.chomp
			  	print "Digite o novo cargo: "
			  	novo_cargo = gets.chomp

			  	atualizar_dados(novo_cargo,id.to_i(),3)

			  else 
			  	  break 

			  end

	  when 4
		  	system ("clear")
		  	print "Atualizar\n\n1-Aluno\n2-Professor\n3-Auxiliar\n0-Voltar\n\nDigite a opcao: "

			opcao2 = gets()

			case opcao2.to_i()
			  when 1
			  	print "Digite o id do aluno para ser deletado: "
			  	id = gets.chomp
			  	deletar_dados(id,1)

			  when 2 
			  	print "Digite o id do professor para ser deletado: "
			  	id = gets.chomp
			  	deletar_dados(id,2)

			  when 3
			  	print "Digite o id do auxiliar para ser deletado: "
			  	id = gets.chomp
			  	deletar_dados(id,3)

			  else 
			  	break

			  end
	  else
	    puts "Opcao invalida ... "
	end

end while opcao.to_i() != 0