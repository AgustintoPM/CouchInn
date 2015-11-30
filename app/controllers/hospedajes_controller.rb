
class HospedajesController < ApplicationController
	before_action :get_hospedaje, only:[:edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  
  def search
    
  end
  
  def consulta
    @res=[]
    titulo=params[:search_titulo]
    lugar=params[:search_lugar]
    tipo=params[:search_tipo]
    fecha=Date.parse params["search_fecha"].values.join("-")
    if (!titulo.blank? and !lugar.blank? and !fecha.blank?)
      @res=Hospedaje.where("titulo =? AND lugar =? AND tipo_id =? or fecha =?", titulo, lugar, tipo, fecha).all
    else
      if (!titulo.blank? and !lugar.blank?)
        @res=Hospedaje.where("titulo =? AND lugar =? AND tipo_id =?",titulo, lugar, tipo).all
      else
        if (!titulo.blank? and !fecha.blank?)
          @res=Hospedaje.where("titulo =? AND tipo_id =? or fecha =?", titulo, tipo, fecha).all
        else
          if (!lugar.blank? and !fecha.blank?)
            @res=Hospedaje.where("lugar =? AND tipo_id =? AND fecha =?", lugar, tipo, fecha).all 
          else
            if (!titulo.blank?)
              @res=Hospedaje.where("titulo =? AND tipo_id =?",titulo, tipo)
            else
              if (!lugar.blank?)
                @res=Hospedaje.where("lugar =? AND tipo_id =?", lugar, tipo)
              else
                if (!fecha.blank?)
                  @res=Hospedaje.where("fecha =? or tipo_id =?", fecha, tipo)
                else
                  @res=Hospedaje.where("tipo_id =?", tipo)
                end
             end
            end
          end
        end
      end
    end
  end
	
	def get_hospedaje
		@hospedaje = Hospedaje.find(params[:id])	
	end
  def hospedaje_params 
    params.require(:hospedaje).permit(:titulo, :descripcion, :foto, 
      :lugar, :capacidad, :tipo_id)
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
    @hospedaje.fecha = Time.now
    @hospedaje.user_id = current_user.id
    if @hospedaje.save
      flash[:success] = "Hospedaje publicado"
      redirect_to @hospedaje
      
    else 
      render 'new'
    end
  end
	#borrar un hospedaje
	def destroy
    
    if (@hospedaje.user_id== current_user.id) then
		  @hospedaje.destroy()
      flash[:success] = "Hospedaje  borrado"
    else
      flash[:danger] = "Operacion no permitida"
    end
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
