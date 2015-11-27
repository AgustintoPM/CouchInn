class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

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
    @user = User.find(params[:format])
    @user.premium = true
    @user.save
  end

  private
   
   def user_params 
    if @user.premium?
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
