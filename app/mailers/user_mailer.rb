class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
	def	account_activation(user)
		@user = user
		mail to: user.email, subject: "Activacion de cuenta CouchInn"
	end
		
	def	password_reset(user)
		@user = user
		mail to: user.email, subject: "Restablecimiento de clave CouchInn"
	end
	def enviar_mail(reserva)
		@reserva=reserva
		mail to: reserva.user.email, subjet: "Su reserva fue aceptada"
	end
end
