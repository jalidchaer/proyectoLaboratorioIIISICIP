class AvalarDefinitivoController < ApplicationController
  def index
  	 @proyectos = Proyecto.all

  	 
  end
end
