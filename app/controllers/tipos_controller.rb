class TiposController < ApplicationController
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]
   before_action :admin_user, only: [:show, :edit, :update, :destroy]
   before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  def index
    @tipos = Tipo.all
  end
  def show

  end
  def new
    @tipo = Tipo.new
  end
  def edit

  end
  def	create
    @tipo = Tipo.new(tipo_params)
    @tipo.disponible= true
    if @tipo.save 
      redirect_to  @tipo, notice: 'tipo creado correctamente'
    else
      render 'new'
  end
  end
  def destroy
    if @tipo.hospedajes.count==0
      @tipo.destroy
      respond_to do |format|
        format.html { redirect_to tipos_url, notice: 'Tipo eliminado.' }
      end
    else
      @tipo.disponible= false
      respond_to do |format|
        format.html { redirect_to tipos_url, notice: 'Tipo eliminado logicamente.' }  
      end
    end
  end

  #def destroy
   # @tipo = Tipo.find(params[:id])
    #if @tipo.hospedajes.count == 0
     # @tipo.destroy
      #flash[:success] = "Tipo Eliminado"
      #redirect_to tipo_url
    #else
     
     # @tipo.disponible = false
      #@tipo.save
      #flash[:success] = "Categoria Eliminada"
      #redirect_to tipo_url
     
   # end
  #end


 def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Inicie sesion, por favor"
        redirect_to login_url
      end
  end



  def update
    respond_to do |format|
      if @tipo.update(tipo_params)
        format.html { redirect_to @tipo, notice: 'Tipo editado' }
        
      else
        format.html { render :edit }
        
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tipo
  @tipo = Tipo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tipo_params
  params.require(:tipo).permit(:nombre)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
   end
 end
