class CreditCardsController < ApplicationController

  def new
  
  	@credit_card = CreditCard.new
  end

  def create
  	require 'securerandom' 
    @credit_card = CreditCard.new(creditcard_param)
    exito = SecureRandom.random_number.round
      if exito == 1
        if @credit_card.save
          current_user.premium=true
          current_user.save
          flash[:success] = "Felicitaciones, ya es usuario premium"
          redirect_to current_user
        else
          render 'users/upgrade'
        end
      else
       flash[:danger] = "Hubo un error validando su tarjeta, vuelva a intentarlo, por favor."
       render 'users/upgrade'
      end 
  end

  def showUpgrade
  
  end


  private
   def creditcard_param 
  
        params.require(:credit_card).permit( :name,:securitynumber,:fullnumber, :adress, :phone, :expdate, :cardtype)
    
   end

end
