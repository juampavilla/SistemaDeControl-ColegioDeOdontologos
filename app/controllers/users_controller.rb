class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :index

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '¡Bienvenido a SACO!'
      redirect_to @user
      # redirect_to profesionales_path
    else
      render 'new'
    end
  end

  def edit
    byebug
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Perfil actualizado'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :profesional_id)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Es necesario loguearse.'
      redirect_to login_url
    end
  end

  # Confirms the correct user.
   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end


    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    # def has_profesional
    #   User.exists?(profesional_id: params[:profesional_id]) unless params[:profesional_id].nil
    # end
end
