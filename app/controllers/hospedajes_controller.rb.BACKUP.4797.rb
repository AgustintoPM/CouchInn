<<<<<<< HEAD
class HospedajesController < ApplicationController
	before_action :get_hospedaje, only:[:edit, :update, :destroy]
	
	def get_hospedaje
		@hospedaje = Hospedaje.find(params[:id])	
	end
	#editar un hospedaje
	def edit
		
	end
	#mostrar un hospedaje
	def show
		@hospedaje = Hospedaje.find(params[:id])
	end
	#borrar un hospedaje
	def destroy
		@hospedaje.destroy()
	end
=======
class HospedajesController < ApplicationController
	def show
		@hospedaje = Hospedaje.find(params[:id])
	end
>>>>>>> 59d4d26b295cfa1347f4b3ed5835829a019fa4e6
end