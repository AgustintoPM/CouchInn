class CreditcardsController < ApplicationController

  def new
  	@user.CreditCard = CreditCard.new
  end


  def showUpgrade
  
  end

end
