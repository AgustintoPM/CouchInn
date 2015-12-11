class UserFeedbacksController < ApplicationController

def new
	@user_feedback= UserFeedback.new
end

def create
	@user_feedback= UserFeedback.new(userfeedback_params)
	if  Reserva.exists?(:user_id => current_user.id, :aceptado => true, :propietario_id => @user_feedback.destination) 

			
			@user_feedback.user = current_user
	
			if @user_feedback.save 
      			redirect_to  user_path(@user_feedback.destination), notice: 'calificacion creada correctamente'
    		else
  		    	render 'new'
  			end
  	else
  		redirect_to root_path
  		flash[:danger] = "NO puede Calificar este usuario porque no se hospedo allí"
  	end
end



private

def userfeedback_params
  params.require(:user_feedback).permit(:content,:score,:destination)
 end
end
