class ArbolController < ApplicationController
  def index
  end




 def ajax
 	@tipo=params[:tipo]
	@arbols = Arbols.new
	@tira = @arbols.BuscarTodosArbolJson(@tipo)
	render :text => @tira
 end
end
