class SessionsController < ApplicationController
  def new
  end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if  user.activated?
	      log_in user # equal to log_in user_url(user) because rails conversion
	      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Account not activated."
        message +=  "Check  your  email for the activation  link."
	      flash[:warning] = message
        redirect_to root_url
      end
    else  
      flash.now[:danger] = 'Combinacion de email/clave invalida'# Loggin error
	    render 'new'
    end
  end

  def destroy
	log_out if logged_in?
	redirect_to root_url
  end
end
