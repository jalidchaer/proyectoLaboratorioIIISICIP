class ControlSeguimientoProyectoController < ApplicationController
  def index
    @proyectos = Proyecto.all
  end

  def show
  	@proyectos= Proyecto.all
  	@proyecto = Proyecto.find(params[:id])
  end

  def estado
  	@proyectos= Proyecto.all
  end

  def progreso
  	@proyectos= Proyecto.all
  end
end

