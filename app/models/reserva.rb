class Reserva < ActiveRecord::Base
	belongs_to :user
	belongs_to :hospedaje
	validate :fecha_invalida 
	validates :desde, :presence  => {:message => "Usted debe ingresar una fecha"}
	validates :hasta, :presence  => {:message => "Usted debe ingresar una fecha"}
	def fecha_invalida
		
		if  desde > hasta 
			errors.add(:desde, "error fechas")
		end
	  

	end
	def	send_email
		UserMailer.enviar_mail(self).deliver_now
	end	
end