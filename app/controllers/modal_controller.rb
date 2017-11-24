class ModalController < ApplicationController
  def registroproyecto
  end
  def index
  end

  def create
      @proyecto = Proyecto.new(proyecto_params)
      if @proyecto.save
        
        flash[:info] = "proyecto registrado exitosamente."
        redirect_to "/modal"
       
      else
        
        render '/inicio'
      end
    end
end
