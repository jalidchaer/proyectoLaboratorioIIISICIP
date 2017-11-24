class AvalarProyectoController < ApplicationController
  def index
  	@proyectos = Proyecto.all
  end
  
end
