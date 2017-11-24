=begin
  acceso_controller.rb
  Autor   : Edgar Gonzalez
  Web     : http://egonzale.org
  Email   : egonzale@ucla.edu.ve
  Rails   : version 4.2.6
  Fecha   : 20 de mayo del 2016
=end
require "libreria"
require 'base64'
require 'curl'

class AccesoController < ApplicationController
  #Error: can't verify csrf token authenticity
  #Solucion: http://stackoverflow.com/questions/23377648/cant-verify-csrf-token-authenticity-rails-4-1
  skip_before_filter :verify_authenticity_token
  
  def index
    render :text => "No hay pagina para mostrar"
  end

  def autenticar
   @tirajson = ""
   @mensaje = "No existe el usuario y/o clave."
   @objMyAesCtr = MyAesCtr.new
   @datos = Array.new
  # @datos[0] = 'miley'#@objMyAesCtr.decrypt(params[:palabraencriptada],params[:usuario],256)
   #@datos[1] ='miley'#@objMyAesCtr.decrypt(params[:palabraencriptada],params[:clave],256)
@correo= params[:usuario]
@clave=params[:clave]
   
@datos[0] = @correo
@datos[1] =@clave
   @objUsuario = Usuarios.new
   @valor = @objUsuario.Buscar(@datos)
   if @valor!=nil
    session[:correo] = @datos[0].to_s# venia con :usuario
    session[:password]   = @datos[1].to_s #venia con :password
    #session[:rol] = @datos[3].to_s # venia con :rol
    @cedula = @datos[2].to_s
    case @datos[3]
     #Rol Administrador
     when "1"
      session[:na]  = "Admin" 
      @url = "inicio"
      @mensaje = "Existe el usuario y/o clave."

     #Rol Estudiante
     when "2"
      #Llamar Servicio Web de CUMLAUDE
      curl = CURL.new 
      begin
       #Usando el metodo Get
       #contenido = curl.get($HostCumLaude+"servicio=1&cedula="+@cedula.to_s)
       #Usando el metodo Post
       contenido = curl.post($HostCumLaude, {"servicio" => "1", "cedula" => @cedula.to_s})
       j=ActiveSupport::JSON
       #convertir como arreglo si hubo exito, j.decode(contenido).to_a[0] trae ["exito", "1"]
       exito = j.decode(contenido).to_a[0] # exito
       if exito.to_a[1].to_s=="1"
        #convertir como arreglo a usuario j.decode(contenido).to_a[1] trae ["cedula", "22000000"]
        cedula = j.decode(contenido).to_a[1][1] # Cedula
        #convertir como arreglo a clave j.decode(contenido).to_a[2] trae ["nombres", "Taylor Swift"]
        nombre = j.decode(contenido).to_a[2][1] # Nombres
        #convertir como arreglo a nivel j.decode(contenido).to_a[3] trae ["foto", "...."]
        #foto = j.decode(contenido).to_a[3][1] # Foto
        #session[:id]  = nombre
        #session[:foto]  = foto
        #print foto
        @url = "inicio"
        @mensaje = "Existe el usuario y/o clave."
       end

      rescue Exception => e
       print e.message
       print "Servidor caido " + $HostCumLaude + "\n"
       curl.clear
      end
     
     #Rol no autorizado
     else 
      @mensaje = "Aun no esta activada esta opcion para el usuario: "+@datos[0].to_s
      @url = "inicio"
    end

    @tirajson = '{"success": "true", "exito": true, "msg": "'+@mensaje+'", "url": "'+@url.to_s+'" }'#iba asi sin el .to_s , "url": "'+@url+'"

   #Rol no existe
   else
    @tirajson = '{"success": "true", "exito": false, "msg": "'+@mensaje+'" }'
   end

   render :text => @tirajson
  end

end