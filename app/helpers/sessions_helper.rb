module SessionsHelper
	def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  	end

  	 # Returns the current logged-in user (if any).
  def current_usuario
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      usuario = User.find_by(id: usuario_id)
      if usuario && usuario.authenticated?(:remember, cookies[:remember_token])
        #log_in usuario
        render 'inicio'
        @current_user = usuario
      end
    end
  end
end
