class Reserva < ActiveRecord::Base
	belongs_to :user
	belongs_to :hospedaje
	validate :fecha_invalida 
	def fecha_invalida
		
		if  desde > hasta 
			errors.add(:desde, "error fechas")
		end
	  

	end
end