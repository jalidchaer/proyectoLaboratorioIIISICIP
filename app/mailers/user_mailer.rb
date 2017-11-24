class UserMailer < ApplicationMailer

 # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mailer.account_activation.subject
  #

   def account_activation(user)
    @usuario = user
    mail to: user.correo, subject: "Activar Cuenta"
  end

   def password_reset(user)
    @usuario = user
    mail to: user.correo, subject: "Restablecer contraseña"
  end

  def enviar_mensaje(user)
    @usuario = user
    
    mail to: user.correo, subject: "Proyecto registrado exitosamente"
  end
end
