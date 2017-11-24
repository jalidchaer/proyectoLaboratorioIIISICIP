=begin
  arbols.rb
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Rails  : version 4.2.6
  Fecha  : 20 de mayo del 2016
=end
# Leer: http://blog.remarkablelabs.com/2012/12/what-s-new-in-active-record-rails-4-countdown-to-2013
#       http://guides.rubyonrails.org/active_record_querying.html
#       http://guides.rubyonrails.org/association_basics.html

class Arbols < ActiveRecord::Base
  @@nro=0

  #ContarHijos, Usado por el metodo: BuscarTodosArbolJson
  def ContarHijos(tipo,padreid)
   #@@nro=@@nro+1
   #@son = Arbols.count(:conditions => "tipo=#{tipo} and padre_id=#{padreid}" )
   #@son = Arbols.find_by_sql "Select count(*) as son From arbols where tipo="+tipo.to_s+" and padre_id="+padreid.to_s
   @arbols = Arbols.all   
   @son=0
   @i=1
   @arbols.each do |arbol|
   	#File.open("arbols"+@i.to_s+".txt", "w+") { |file| file.write(tipo.to_s+" "+padreid.to_s) }   
   	if arbol.tipo.to_i==tipo.to_i and arbol.padre_id.to_i==padreid.to_i
   	 @son=@son+1
   	 @i=@i+1;
   	end
   end
   #File.open("out"+@@nro.to_s+".txt", "w+") { |file| file.write(tipo.to_s+" "+padreid.to_s+" "+@son.to_s) }   
   return @son 
  end
  
  #ObtenerHijos, Usado por el metodo: BuscarTodosArbolJson
  def ObtenerHijos(tipo,padreid)
	 totaldeRegistros1 = self.ContarHijos(tipo,padreid)
	 #out_file = File.new("out.txt", "w+")
   #out_file.puts "padreid "+padreid.to_s +" tr1 "+totaldeRegistros1.to_s
   #out_file.close
   #File.open("out.txt", "w+") { |file| file.write(tipo.to_s+" "+padreid.to_s+" "totaldeRegistros1.to_s) }
	 if totaldeRegistros1>0
	  @tira = @tira+"  children: [ "
	  #@arbols = Arbols.find(:all, :conditions => "tipo=#{tipo} and padre_id=#{padreid}" )
	  #@arbols = Arbols.where("tipo = ? AND padre_id = ?", tipo, padreid)
	  @arbols = Arbols.find_by_sql "Select * From arbols where tipo="+tipo.to_s+" and padre_id="+padreid.to_s
	  i=0
	  @arbols.each do |arbol|
	   @tira = @tira+" { text: '" + arbol.text + "', id: '" + arbol.id.to_s  + "', href: '"+arbol.vinculo+"', "
	   self.ObtenerHijos(tipo,arbol.id)
	   i=i+1
     if i<totaldeRegistros1
      @tira = @tira+" }, "
     else
      @tira = @tira+" } ] "
	   end
	  end
	 else
	  @tira = @tira+"  leaf: true  "
	 end
  end
	
  #Buscar todos los nodos y generar en formato JSON para Ext.tree.Panel
  def BuscarTodosArbolJson(tipo)
   @arbols = Arbols.new
   totaldeRegistros = self.ContarHijos(tipo,0);
   @tira='[ '
   if totaldeRegistros>0            
		#@arbols = Arbols.find(:all, :conditions => "tipo=#{tipo} and padre_id=0" )
		#@arbols = Arbols.where("tipo = ? AND padre_id = ?", tipo, 0)
		@arbols = Arbols.find_by_sql "Select * From arbols where tipo="+tipo.to_s+" and padre_id=0"
		j=0
		@arbols.each do |arbol|
		 @tira = @tira+" { text: '" + arbol.text + "',expanded: true, id: '" + arbol.id.to_s  + "', href: '', "
		 self.ObtenerHijos(tipo,arbol.id)
		 j=j+1
     if j<totaldeRegistros
      @tira = @tira+ " }, "
     else
      @tira = @tira+" } ] "
		 end
		end
	 else
		@tira= @tira+"{ { text: 'No hay datos', id: '0', href: '', leaf: true } } ]"
	 end
	 return @tira
  end
  
  #Actualizar Nodo
  def Actualizar(idnodo, nombrenodo, tipo, padreid)
   nodo = Arbols.find_by(id: "#{idnodo}")
   if nodo.nil?
    return 0
   else
    nodo.update(text: "#{nombrenodo}")
    return 1
   end
  end
  
  #Agregar Nodo
  def Agregar(idnodo, nombrenodo, tipo, padreid, vinculo)
   vinculo = "ejemplo01";
   unless Arbols.exists?(:text => "#{nombrenodo}")
    @arbols = Arbols.new 
    @arbols.tipo = tipo
    @arbols.padre_id = padreid
    @arbols.text = nombrenodo
    @arbols.vinculo = vinculo
    @arbols.save
    @son = Arbols.maximum("id")
    return @son, vinculo
   end
   return 0, vinculo
  end
  
  #Eliiminar Nodo
  def Eliminar(id)
   if Arbols.exists?(id)
    arbol = Arbols.find_by(id: "#{id}")
    arbol.destroy
    if arbol.destroyed?
     return id
    else
     return 0
    end      
   end 
   return 0
  end

end