
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
end
