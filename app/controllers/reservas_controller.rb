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
    h= Hospedaje.find(@reserva.hospedaje_id)
    @reserva.hospedaje = h
    @reserva.aceptado = false
    @reserva.user= current_user
    @reserva.propietario_id= h.user_id
    rese= Reserva.where("hospedaje_id =? and aceptado =?", @reserva.hospedaje_id, true).all
    la=true
    if !(@reserva.desde.nil? and @reserva.hasta.nil?)
      if rese.count==0
        la = true
      else
        rese.each do |r|
        
          if (@reserva.hasta < r.desde ) | (@reserva.desde > r.hasta )
            la=true
          else
            la=false
          
          end
        end
      end


    
      
        if la

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

     
     
    else
      redirect_to new_reserva_url(@reserva.hospedaje_id)
      flash[:danger] = 'Las fechas no pueden estar en blanco'

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
    
    lala = true
    re= Reserva.where("hospedaje_id =? and aceptado =?", @rese.hospedaje_id, true).all
    if re.count == 0
      lala=true
    else
      re.each do |r|
        if not((@rese.hasta < r.desde ) | (@rese.desde > r.hasta )) 
        lala= false
        end
      end
    end
    if lala == true
      @rese.aceptado = true
      
      #@rese.send_email
      redirect_to  @rese, notice: 'reserva aceptada correctamente'
      @rese.save
    else 
      redirect_to @rese.hospedaje      flash[:danger] = "Fecha ya reservada"

    
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
  def index_hospedajes
    @reservas= Reserva.all
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  

  # Never trust parameters from the scary internet, only allow the white list through.
  def reserva_params
  params.require(:reserva).permit(:hospedaje_id,:desde,:hasta)
  end
end
