class HospedajesfeedbacksController < ApplicationController


def new
	@hospedajefeedback= Hospedajesfeedback.new
end
def create
	
	if  Reserva.exists?(:user_id => current_user.id, :aceptado => true)


	
	@hospedajefeedback= Hospedajesfeedback.new(hospedajefeedback_params)
	@hospedajefeedback.user = current_user
	
	if @hospedajefeedback.save 
      redirect_to  hospedajesfeedbacks_path(@hospedajefeedback.destino_id), notice: 'calificacion creada correctamente'
    else
      render 'new'
  	end
  	else
  		redirect_to root_path
  		flash[:danger] = "NO puede Calificar este lugar porque no se hospedo allí"
  	end
end

def index
	@hospedajefeedback= Hospedajesfeedback.all
end

private

def hospedajefeedback_params
  params.require(:hospedajesfeedback).permit(:descripcion,:puntaje,:destino_id)
 end


































end
