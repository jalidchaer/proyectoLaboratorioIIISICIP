class SessionsController < ApplicationController

  def new
    
  end

=begin
  def create
    user = User.find_by_email(params[:email])
    # if the user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end
=end
  def create
    usuario = User.find_by(correo: params[:correo])
    # if the user exists AND the password entered is correct
   if usuario && usuario.authenticate(params[:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
       if usuario.activated?
        session[:user_id] = usuario.id
        #params[:remember_me] == '1' ? remember(usuario) : forget(usuario)
        #redirect_back_or usuario
        #flash[:alert] = "Bienvenido has ingresado exitosamente."
       
       
        redirect_to '/inicio', flash: {notice:  "Bienvenido has ingresado exitosamente."}
       else
        message  = "Cuenta no activada. "
        message += "Revisa tu correo y has click en el link de activacion de tu cuenta."
        flash[:warning] = message
       
        redirect_to root_url
      end

    else
      flash[:notice] = "Datos introducidos incorrectos."
       render 'new', notice: "Datos introducidos incorrectos."

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end



end