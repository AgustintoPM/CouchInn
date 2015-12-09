class Reserva < ActiveRecord::Base
	belongs_to :user
	belongs_to :hospedaje
	validate :fecha_invalida
	def fecha_invalida
		now= DateTime.now.to_date
		if  desde > hasta and desde < now
			errors.add(:desde, "error fechas")
		end
	  

	end
end