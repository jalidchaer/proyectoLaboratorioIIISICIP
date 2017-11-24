class PerfilController < ApplicationController
  def index
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @nombre = @current_user.name
    @correo =@current_user.email
  end
end
