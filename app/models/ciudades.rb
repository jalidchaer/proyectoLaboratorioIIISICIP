=begin
  ciudades.rb
  Autor  : Edgar Gonzalez
  Web    : http://egonzale.org
  Email  : egonzale@ucla.edu.ve
  Rails  : version 4.2.6
  Fecha  : 20 de mayo del 2016
=end
class Ciudades < ActiveRecord::Base

 def BuscarTodos()
	@tirajson = Ciudades.all
	return @tirajson.to_json
 end

end