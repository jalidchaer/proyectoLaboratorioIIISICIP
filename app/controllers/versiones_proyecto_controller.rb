class VersionesProyectoController < ApplicationController
  def index
  	@proyectos = Proyecto.all
  end
end
