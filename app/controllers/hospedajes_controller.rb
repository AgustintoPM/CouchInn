
class HospedajesController < ApplicationController
	before_action :get_hospedaje, only:[:edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
	
	def get_hospedaje
		@hospedaje = Hospedaje.find(params[:id])	
	end
  def hospedaje_params 
    params.require(:hospedaje).permit(:titulo, :foto, 
      :lugar, :fecha, :capacidad, :tipo_id)
  end
  def new
    @hospedaje = Hospedaje.new
  end
	#editar un hospedaje
	def edit	
	end
   def update
     if @hospedaje.update_attributes(hospedaje_params)
       flash[:success] = "Hospedaje Actualizado"
       redirect_to @hospedaje
	 else
		render 'edit'
	 end
  end
	#mostrar un hospedaje
	def show
		@hospedaje = Hospedaje.find(params[:id])
	end
  def create
    @hospedaje = Hospedaje.new(hospedaje_params)
    if @hospedaje.save
      flash[:success] = "Hospedaje publicado"
      redirect_to @hospedaje
    else 
      render 'new'
    end
  end
	#borrar un hospedaje
	def destroy
		@hospedaje.destroy()
    flash[:success] = "Hospedaje  borrado"
    redirect_to hospedajes_path
	end
  
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Inicie sesion, por favor"
        redirect_to login_url
      end
  end
end
