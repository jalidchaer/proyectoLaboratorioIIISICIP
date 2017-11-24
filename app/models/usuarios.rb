=begin
  usuarios.rb
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Rails  : version 4.2.6
  Fecha  : 20 de mayo del 2016
=end

require "Array2D"

class Usuarios < ActiveRecord::Base

 def ContarRegistros(nivel)
  if nivel.nil?
   return Usuarios.count
  else
   return Usuarios.where(nivel: "#{nivel}").count  
  end
 end

 def BuscarTodosOrdenados(start, limit, order)
  @objUsuarios = Usuarios.limit(limit).offset(start).order(order)
  unless @objUsuarios.empty?
   return 1, @objUsuarios, @objUsuarios.length
  end   
  return 0, nil, nil;
 end

 def BuscarTodos(datos)
  @son = 0
  @registros = Usuarios.all
  @son = Usuarios.count
  if @son > 0
   datos = Array2D.new(@son,5)
   @j=0
   @registros.each do |registro|
    datos[@j,0] = registro.usuario
    datos[@j,1] = registro.clave
    datos[@j,2] = registro.cedula
    datos[@j,3] = registro.nivel
    datos[@j,4] = registro.fecharegistro
    @j=@j+1
   end
  end
  return datos, @son
 end

 def BuscarTodosJson()
  @tirajson = Usuarios.all
  return @tirajson.to_json
 end

 def Buscar(datos)
  #@valor = false
  @objUsuario = nil
  @objUsuario = Usuarios.find_by(["usuario = '#{datos[0].to_s}' and clave = '#{datos[1].to_s}'"])
  if @objUsuario != nil
   datos[2] = @objUsuario.cedula
   datos[3] = @objUsuario.nivel
   datos[4] = @objUsuario.fecharegistro
   #@valor = true
   #puts datos[2].to_s+ " aqui"
  end
  return @objUsuario
 end
  
 def Buscarxusuario(datos)
  @valor = false
  @objUsuario = nil
  @objUsuario = Usuarios.find_by(["usuario = '#{datos[0].to_s}'"])
  if @objUsuario != nil
   datos[1] = @objUsuario.clave
   datos[2] = @objUsuario.cedula
   datos[3] = @objUsuario.nivel
   datos[4] = @objUsuario.fecharegistro
   @valor = true
  end
  return @valor,datos
 end

 def Grabar(usuario,clave,cedula,rol,fecharegistro) 
  @valor = false
  @objUsuario = Usuarios.find_by(usuario: "#{usuario.to_s}")
  if @objUsuario != nil
   @objUsuario.update(clave: "#{clave}", nivel: "#{rol}", fecharegistro: "#{fecharegistro}")
   @valor = true
  else
   @objNewUsuario = Usuarios.new
   @objNewUsuario.usuario = usuario  
   @objNewUsuario.clave = clave
   @objNewUsuario.cedula = cedula
   @objNewUsuario.nivel = rol
   @objNewUsuario.fecharegistro = fecharegistro
   @objNewUsuario.save
   @valor = true
  end
  return @valor
 end
  
 def Eliminarxusuario(usuario)
  objUsuario = Usuarios.find_by(usuario: "#{usuario}")
  objUsuario.destroy
  return objUsuario.destroyed?
 end 

end