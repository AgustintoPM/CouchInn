
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
    v_aux=params[:search_fecha]
    if (!v_aux["fecha(1i)"].blank? and !v_aux["fecha(2i)"].blank? and !v_aux["fecha(3i)"].blank?)
      fecha=Date.parse params[:search_fecha].values.join("-")
    else
      fecha=' '
    end
    
    if (!titulo.blank? and !lugar.blank? and !fecha.blank? and !tipo.blank?)
      @res=Hospedaje.where("titulo like ? AND lugar like ? AND tipo_id =? AND fecha =? AND borrado =?", "%#{titulo}%", "%#{lugar}%", tipo, fecha, false).all
    else
      if (!titulo.blank? and !lugar.blank? and !tipo.blank?)
        @res=Hospedaje.where("titulo like ? AND lugar like ? AND tipo_id =? AND borrado =?", "%#{titulo}%", "%#{lugar}%", tipo, false).all
      else
        if (!titulo.blank? and !fecha.blank? and !tipo.blank?)
          @res=Hospedaje.where("titulo like ? AND tipo_id =? AND fecha =? AND borrado =?", "%#{titulo}%", tipo, fecha, false).all
        else
          if (!lugar.blank? and !fecha.blank? and !tipo.blank?)
            @res=Hospedaje.where("lugar like ? AND tipo_id =? AND fecha =? AND borrado =?", "%#{lugar}%", tipo, fecha, false).all 
          else
            if (!titulo.blank? and !lugar.blank?)
              @res=Hospedaje.where("titulo like ? AND lugar like ? AND borrado =?", "%#{titulo}%", "%#{lugar}%", false).all
            else
              if (!lugar.blank? and !fecha.blank?)
                @res=Hospedaje.where("lugar like ? AND fecha =? AND borrado =?", "%#{lugar}%", fecha, false).all
              else
                if (!fecha.blank? and !titulo.blank?)
                  @res=Hospedaje.where("fecha =? AND titulo like ? AND borrado =?", fecha, "%#{titulo}%", false).all
                else
                  if (!fecha.blank? and !tipo.blank?)
                    @res=Hospedaje.where("fecha =? AND tipo_id =? AND borrado =?", fecha, tipo, false).all
                  else
                    if  (!titulo.blank? and !tipo.blank?)
                      @res=Hospedaje.where("titulo like ? AND tipo_id =? AND borrado =?", "%#{titulo}%", tipo, false).all
                    else
                      if (!lugar.blank? and !tipo.blank?)
                        @res=Hospedaje.where("lugar like ? AND tipo_id =? AND borrado =?", "%#{lugar}%", tipo, false).all
                      else
                        if (!titulo.blank?)
                          @res=Hospedaje.where("titulo like ? AND borrado =?", "%#{titulo}%", false).all
                        else
                          if (!lugar.blank?)
                            @res=Hospedaje.where("lugar like ? AND borrado =?", "%#{lugar}%", false).all
                          else
                            if (!fecha.blank?)
                              @res=Hospedaje.where("fecha =? AND borrado =?", fecha, false).all
                            else
                              if (!tipo.blank?)
                                @res=Hospedaje.where("tipo_id =? AND borrado =?", tipo, false).all
                              end
                            end
                          end
                        end
                      end
                    end
                  end
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
    @hospedaje.borrado= false
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
      if (@hospedaje.reservas.count==0)
		    @hospedaje.destroy()
      else
        @hospedaje.borrado=true
        @hospedaje.save
      end
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
