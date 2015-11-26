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
    @reserva.user_id = current_user.id
    @reserva.aceptado = false
    if @reserva.save
      redirect_to  @reserva, notice: 'reserva creada correctamente'
    else
      render 'new'
  end
  end
  def destroy
    
      @reserva.destroy
      respond_to do |format|
        format.html { redirect_to tipos_url, notice: 'Tipo eliminado.' }    
    
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

  def update
    respond_to do |format|
      if @reserva.update(tipo_params)
        format.html { redirect_to @tipo, notice: 'Reserva editado' }
        
      else
        format.html { render :edit }
        
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tipo
  @resreva = Reserva.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reserva_params
  params.require(:reserva).permit(:hospedaje_id)
  end
 



	
end
