class EvaluarInvestigadorController < ApplicationController
 before_action :set_evaluacion, except: [:evaluacion, :index, :show]


  def index
  	@proyectos= Proyecto.all
    @evaluadores = Evaluadore.all
  end

  def show
    @proyectos = Proyecto.all
    @proyecto = Proyecto.find(params[:id])
  end

 


  def evaluacion
     @proyectos= Proyecto.all
      @proyecto = Proyecto.where(:id => session[:id]).first
      
     # @proyecto.update_attribute(:cont,@cont)
     @evaluacion = Evaluacion.new(evaluacion_params)
      if @evaluacion.save
        if @evaluacion.conclusion=="Aprobar"
          @cont=@proyecto.cont + 1
          @decont=@proyecto.decont - 1
          @proyecto.update_attribute(:cont,@cont)
           @proyecto.update_attribute(:decont,@decont)
        else
           @decont=@proyecto.decont - 1
          @proyecto.update_attribute(:decont,@decont)
        end
        if @proyecto.cont>=2# and cont2>0 realizar un contador hacia atras que inicie en 3 y cada voto le descuente 1
           @proyecto.update_attribute(:estado,"Avalado")
           @estado_proyecto = EstadosProyecto.new(:proyecto_id => @proyecto.id, :estado_id =>4)
           @estado_proyecto.save
         else
          @estado_proyecto = EstadosProyecto.new(:proyecto_id => @proyecto.id, :estado_id =>3)
          @estado_proyecto.save

        end
      render :index
      session[:id] = nil
      end 
    end
  

 

  def listado_proyectos
     @proyectos= Proyecto.all
  end

  

  def ver
     @proyectos= Proyecto.all
  end

  

  # PATCH/PUT /evaluadores/1
  # PATCH/PUT /evaluadores/1.json
  

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion
      @evaluacion = Evaluacion.find(params[:id])
    end

    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluacion_params
      params.require(:evaluacion).permit(:resp1, :resp2, :resp3, :resp4, :resp5, :resp6, :resp7, :resp8, :resp9, :resp10, :conclusion, :proyecto_id)
    end

    def proyecto_params
      params.require(:proyecto).permit(:id, :cont)
    end

end
