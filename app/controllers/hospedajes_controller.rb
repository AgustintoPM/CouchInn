
class HospedajesController < ApplicationController
	before_action :get_hospedaje, only:[:edit, :update, :destroy]
	
	def get_hospedaje
		@hospedaje = Hospedaje.find(params[:id])	
	end
  def hospedaje_params 
    params.require(:hospedaje).permit(:titulo, :foto, 
      :lugar, :fecha, :capacidad)
  end
  def new
    @hospedaje = Hospedaje.new
  end
	#editar un hospedaje
	def edit
		
	end
	#mostrar un hospedaje
	def show
		@hospedaje = Hospedaje.find(params[:id])
	end
  def create
    @hospedaje = Hospedaje.create(hospedaje_params)
    redirect_to hospedajes_path
  end
	#borrar un hospedaje
	def destroy
		@hospedaje.destroy()
    flash[:success] = "Hospedaje  borrado"
    redirect_to hospedajes_path
	end
end
