class InicioController < ApplicationController
  def index
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
   if session[:user_id]
    @rol = @current_user.rol

   
    
	else
	@rol=""
    end
  end

    

  

  def ajax
 	@tipo=params[:tipo]
	@arbols = Arbols.new
	@tira = @arbols.BuscarTodosArbolJson(@tipo)
	render :text => @tira
  end

 

end