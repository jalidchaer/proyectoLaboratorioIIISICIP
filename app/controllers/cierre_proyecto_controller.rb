class CierreProyectoController < ApplicationController
  def index
  	@proyectos = Proyecto.all
  end
end
