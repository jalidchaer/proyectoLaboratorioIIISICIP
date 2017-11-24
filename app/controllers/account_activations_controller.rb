class AccountActivationsController < ApplicationController

	def edit
    usuario = User.find_by(correo: params[:correo])
    if usuario && !usuario.activated? && usuario.authenticated?(:activation, params[:id])
      usuario.activate
      session[:user_id] = usuario.id
      flash[:success] = "Cuenta activada!"
      #redirect_to usuario
      redirect_to '/inicio'
    else
      flash[:danger] = "link de activacion invalido"
      redirect_to root_url
    end
  end
end
