class TiposController < ApplicationController
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]
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
    if @tipo.save 

      @tipo.disponible= true;
      redirect_to  @tipo, notice: 'tipo creado correctamente'
    else
      render 'new'
  end
  end
  def destroy
    @tipo.destroy
    respond_to do |format|
      format.html { redirect_to tipos_url, notice: 'Tipo eliminado.' }
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
 end
