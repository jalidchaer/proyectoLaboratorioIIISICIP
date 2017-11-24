class AsignacionEvaluadoresController < ApplicationController
  def index
  	@proyectos= Proyecto.all
     @evaluadores = Evaluadore.all
    # @dpdi = User.abc
  end

  def asignacion
   
    @proyectos = Proyecto.all
    @evaluadores = Evaluadore.all
  end

  def show
    #@dpdi = User.abc
      @evaluadores = Evaluadore.all
  	 @proyecto = Proyecto.find(params[:id])
  end


   private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

   

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:fecha, :codigo, :responsable, :titulo, :objetivogeneral, :objetivosespecifo, :resumen, :duracion, :monto, :estado,evaluadore_ids:[])
    end
end