class ReservasController < ApplicationController
	 
   before_action :logged_in_user, only: [:new, :edit, :update, :destroy, :aceptar]
  def index
    @reservas = Reserva.all
  end
  def show
    @reserva = Reserva.find(params[:id])

  end
  def new
    @reserva = Reserva.new
  end
  def edit

  end
  def	create
    @reserva = Reserva.new(reserva_params)
    @reserva.hospedaje = Hospedaje.find(@reserva.hospedaje_id)
    @reserva.aceptado = false
    @reserva.user= current_user
    if not Reserva.exists?(:user_id => current_user.id, :hospedaje_id =>@reserva.hospedaje.id) and @reserva.save 
      redirect_to  @reserva, notice: 'reserva creada correctamente'
    else
      redirect_to hospedajes_path
      flash[:danger] = 'Ya solicito este hospedaje'
    end
  end

 












  def destroy
    
      @reserva.destroy
      respond_to do |format|
        format.html { redirect_to reservas_url, notice: 'Tipo eliminado.' }    
    
  	 	end
  end

  


 def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Inicie sesion, por favor"
        redirect_to login_url
      end
  end

  def aceptar
     @rese = Reserva.find(params[:id])

    @rese.aceptado = true
    @rese.save
  end
  def rechazar
     @rese = Reserva.find(params[:id])

    @rese.aceptado = false
    @rese.save
  end

  def update
    respond_to do |format|
      if @reserva.update(tipo_params)
        format.html { redirect_to @reserva, notice: 'Reserva editado' }
        
      else
        format.html { render :edit }
        
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  

  # Never trust parameters from the scary internet, only allow the white list through.
  def reserva_params
  params.require(:reserva).permit(:hospedaje_id)
  end
 



	
end
