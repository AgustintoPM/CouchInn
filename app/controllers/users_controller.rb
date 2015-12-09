class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  #ver los hospedajes de un usuario
  def hospedajes
    @hospedajes=Hospedaje.where("user_id =? and borrado =?", current_user.id, false).all 
  end

  def new
   @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
   @user = User.find(params[:id])
  end

  def	create
   @user = User.new(user_params)
   if @user.save 
      @user.send_activation_email
      flash[:info] = "Verifique su correo para activar su cuenta, por vafor. El link estara disponible por dos horas."
      redirect_to root_url
   else
    render 'new'
   end
  end

  def edit
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usario borrado"
    redirect_to users_url
    end

  def update
	 if @user.update_attributes(user_params)
		flash[:success] = "Perfil Actualizado"
    redirect_to @user
	 else
		render 'edit'
	 end
  end

  def upgrade
    require 'securerandom'  
    @user = current_user
    #exito = SecureRandom.random_number.round
      #if exito == 1
        
        render 'creditcards/new'
        #@user.premium = true
        #@user.save
        #flash[:success] = "Felicitaciones, es usuario premium."
     # else
       # flash[:danger] = "Hubo un error validando su tarjeta, vuelva a intentar en unos minutos, por favor."
        #redirect_to @user 
      #end 
    end  

 
  def showUpgrade
  
  end

  def quitPremium
      @user = current_user
    if @user.premium?
       @user.premium = false
        @user.save
        flash[:success] = "Perfil Actualizado, ya no es mas usuario premium."
        redirect_to @user
    end
  end

  def showPremium
  end

  #hospedajes de un usuario
  def hospedajes
    @hospedajes=Hospedaje.where("user_id=? and  borrado=?",current_user.id,false).all?
  end


  private
   
   def user_params 
    if !@user.nil? && @user.premium?
        params.require(:user).permit(:name, :email, 
                                 :password, :password_confirmation, :credit_card)
    else
        params.require(:user).permit(:name, :email, 
                                 :password, :password_confirmation) 
    end
   end

   #Confirms an admin user.
   def admin_user
    redirect_to(root_url) unless current_user.admin?
   end

  #Confirms a logged-in user.
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Inicie sesion, por favor"
        redirect_to login_url
      end
  end

  # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end



end
