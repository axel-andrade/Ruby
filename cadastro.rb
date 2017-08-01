require "sqlite3"

def criar_tabelas()

        # Open a database
        db = SQLite3::Database.new "Pessoa.db"

        # Create a table
        rows = db.execute <<-SQL
          CREATE TABLE IF NOT EXISTS alunos(
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            idade INTEGER,
            curso TEXT NOT NULL,
            matricula INTEGER
          );
        SQL

        # Create a table
        rows = db.execute <<-SQL
          CREATE TABLE IF NOT EXISTS professores (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            idade INTEGER,
            disciplina TEXT NOT NULL,
            salario REAL
          );
        SQL

        # Create a table
        rows = db.execute <<-SQL
          CREATE TABLE IF NOT EXISTS auxiliares  (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            idade INTEGER,
            cargo TEXT NOT NULL,
            salario REAL
          );
        SQL
end

def inserir_dados(objeto,opcao)
   
    if opcao == 1
        	begin
        	    
        	   db = SQLite3::Database.open "Pessoa.db"

               db.execute("INSERT INTO alunos (nome, idade,curso,matricula)
                      VALUES (?, ?, ?, ?)", [objeto.nome,objeto.idade,objeto.curso,objeto.matricula])

               puts "Os dados foram inseridos com sucesso ..." 
        	    
        	rescue SQLite3::Exception => e 
        	    
        	    puts "Exception occurred"
        	    puts "Erro ao inserir dados: " + e
        	    
        	ensure
        	    db.close if db
        	end

    elsif opcao == 2
      
          begin
        
          db = SQLite3::Database.open "Pessoa.db"

          db.execute("INSERT INTO professores (nome, idade,disciplina,salario)
                VALUES (?, ?, ?, ?)", [objeto.nome,objeto.idade,objeto.disciplina,objeto.salario])

          puts "Os dados foram inseridos com sucesso ..." 
        
          rescue SQLite3::Exception => e 
        
          puts "Exception occurred"
          puts  e
        
          ensure
              db.close if db
          end

    elsif opcao == 3
      
          begin
        
          db = SQLite3::Database.open "Pessoa.db"

          db.execute("INSERT INTO auxiliares (nome, idade,cargo,salario)
                VALUES (?, ?, ?, ?)", [objeto.nome,objeto.idade,objeto.cargo,objeto.salario])

          puts "Os dados foram inseridos com sucesso ..." 
        
          rescue SQLite3::Exception => e 
        
          puts "Exception occurred"
          puts e
        
          ensure
              db.close if db
          end
    else 
          puts "Opcao Invalida ..."

    end

end 

def visualizar_dados(opcao)

    if opcao == 1

          db = SQLite3::Database.open "Pessoa.db"
          
          @linhas = db.execute "SELECT * FROM alunos"

          #enum = linhas.enum_for(:each_entry)
          #enum.each { |b| puts b }

          #for valor in @linhas 
          #	print valor 
          #end   
          
          @linhas.each_with_index do |valor,i| #lendo vetor com indices e valores 
               print valor 
               print "\n"
          end

          #puts @linhas.length pega o tamanho do array
          puts "\n\n"

          #linhas.each do |lang|
            #puts  lang 
          #end

    elsif opcao == 2
      
          db = SQLite3::Database.open "Pessoa.db"
          
          @linhas = db.execute "SELECT * FROM professores"

          @linhas.each_with_index do |valor,i| #lendo vetor com indices e valores 
               print valor 
               print "\n"
          end

          #puts @linhas.length pega o tamanho do array
          puts "\n\n"

    elsif opcao == 3
      
          db = SQLite3::Database.open "Pessoa.db"
          
          @linhas = db.execute "SELECT * FROM auxiliares"

          @linhas.each_with_index do |valor,i| #lendo vetor com indices e valores 
               print valor 
               print "\n"
          end

          #puts @linhas.length pega o tamanho do array
          puts "\n\n"
    else 
          puts "Opcao Invalida ... "

    end

end

def atualizar_dados(novo,id_objeto,opcao)
   
    if opcao == 1

        begin

    	    db = SQLite3::Database.open "Pessoa.db"
    	   
            db.execute("UPDATE alunos SET curso = ? WHERE ID = ?",[novo,id_objeto])
            
            puts "O(s) dado(s) esta(o) atualizado(s) ... "

        rescue SQLite3::Exception => e 
        
        print "Erro ao atualizar dados: " 
        puts e
        
        ensure
           db.close if db

        end

    elsif opcao == 2

        begin

          db = SQLite3::Database.open "Pessoa.db"
         
            db.execute("UPDATE professores SET disciplina = ? WHERE ID = ?",[novo,id_objeto])
            
            puts "O(s) dado(s) esta(o) atualizado(s) ... "

        rescue SQLite3::Exception => e 
        
        print "Erro ao atualizar dados: " 
        puts e
        
        ensure
           db.close if db

        end

    elsif opcao == 3

        begin

          db = SQLite3::Database.open "Pessoa.db"
         
            db.execute("UPDATE auxiliares SET cargo = ? WHERE ID = ?",[novo,id_objeto])
            
            puts "O(s) dado(s) esta(o) atualizado(s) ... "

        rescue SQLite3::Exception => e 
        
        print "Erro ao atualizar dados: " 
        puts e
        
        ensure
           db.close if db

        end

    else 
        puts "Opcao Invalida ... "

    end

end

def deletar_dados(id_objeto,opcao)
   
  if opcao == 1

      begin

  	    db = SQLite3::Database.open "Pessoa.db"
  	   
          db.execute("DELETE FROM alunos WHERE ID = ?",[id_objeto])
      
      rescue SQLite3::Exception => e 
      
      print "Erro ao deletar dado: " 
      puts e
      
      ensure
         db.close if db

      end

  elsif opcao == 2 

      begin

        db = SQLite3::Database.open "Pessoa.db"
       
          db.execute("DELETE FROM professores WHERE ID = ?",[id_objeto])
      
      rescue SQLite3::Exception => e 
      
      print "Erro ao deletar dado: " 
      puts e
      
      ensure
         db.close if db

      end

  elsif opcao == 3

      begin

        db = SQLite3::Database.open "Pessoa.db"
       
          db.execute("DELETE FROM auxiliares WHERE ID = ?",[id_objeto])
      
      rescue SQLite3::Exception => e 
      
      print "Erro ao deletar dado: " 
      puts e
      
      ensure
         db.close if db

      end

  else 
      puts "Opcao Invalida ... "

  end

end
