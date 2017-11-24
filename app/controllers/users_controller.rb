class UsersController < ApplicationController

  def new
  end

  

  

  def create
    @usuario = User.new(user_params)
    if @usuario.save
      @usuario.send_activation_correo
      flash[:info] = "Correo de activacion enviado al correo."
      redirect_to "/login"
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:nombre, :apellido,:correo, :rol, :password, :password_confirmation)
  end
end