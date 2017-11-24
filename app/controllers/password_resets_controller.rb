class PasswordResetsController < ApplicationController
	before_action :get_usuario,   only: [:edit, :update]
   	before_action :valid_usuario, only: [:edit, :update]
  	before_action :check_expiration, only: [:edit, :update]    # Case (1)
  	
  	def new
  	end

  def create
    @usuario = User.find_by(correo: params[:password_reset][:correo].downcase)
    if @usuario
      @usuario.create_reset_digest
      @usuario.send_password_reset_correo
      flash[:info] = "Correo enviado con instrucciones para reestablecer su clave"
      
      redirect_to root_url
    else
      flash.now[:danger] = "Direccion de correo no encontrada"
      
      render 'new'
    end
  end

  def edit
     @usuario = User.find_by(correo: params[:correo])
  end

  def update
     @usuario = User.find_by(correo: params[:correo])
    if params[:user][:password].empty?
      @usuario.errors.add(:password, "No puede estar vacio")
      render 'edit'
    elsif @usuario.update_attributes(user_params)
      
      @usuario.update_attribute(:reset_digest, nil)
      flash[:success] = "La contraseña ha sido reestablecida."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

   def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_usuario
      @usuario = User.find_by(correo: params[:correo])
    end

    # Confirms a valid user.
    def valid_usuario
      unless (@usuario && @usuario.activated? &&
              @usuario.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

        # Checks expiration of reset token.
    def check_expiration
      if @usuario.password_reset_expired?
        flash[:danger] = "Peticion de reestablecimiento de clave expirada"
        redirect_to new_password_reset_url
      end
    end
end
