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
    @rese= Reserva.all
    lala=true
    @rese.each do |r|
      if r.hospedaje_id == @reserva.hospedaje_id and r.aceptado
        if !(@reserva.hasta < r.desde ) | (@reserva.desde > r.hasta )
          lala=false
        
        end
      end
    end

    
      if  Reserva.exists?(:user_id => current_user.id, :hospedaje_id =>@reserva.hospedaje.id) 
         redirect_to hospedajes_path
          flash[:danger] = 'Ya solicito este hospedaje'
      else
        if lala

          if @reserva.save 
            redirect_to  @reserva, notice: 'reserva creada correctamente'
          else
            redirect_to new_reserva_url(@reserva.hospedaje_id)
            flash[:danger] = 'fecha incorrecta'
          end
        else
          redirect_to new_reserva_url(@reserva.hospedaje_id)
            flash[:danger] = 'fecha ocupada'
        end

     
      end
    end  
  def destroy
      @reserva= Reserva.find(params[:id])
      @reserva.destroy
      respond_to do |format|
        format.html { redirect_to reservas_url, notice: 'Reserva eliminada' }    
    
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
    @rese.fecha= Time.now #fecha de aceptacion de la reserva
    @rese.aceptado = true
    lala=true
    @re= Reserva.where("hospedaje_id =?", @rese.hospedaje_id).all
    @re.each do |r|
      if !(@rese.hasta < r.desde ) | (@rese.desde > r.hasta ) and r.aceptado
        lala=false
      end
    end
    if lala
      @rese.save
      redirect_to  @rese, notice: 'reserva aceptada correctamente'
    else
    flash[:danger] = "Fecha ocupada"
    end
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
  params.require(:reserva).permit(:hospedaje_id,:desde,:hasta)
  end
end
