class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :admin_user, only: [:index, :new, :create]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @profesionalParam = params[:profesional_id];

    if !@profesionalParam.nil?
      @profesional = Profesional.find @profesionalParam
      @user = User.new(profesional_id: @profesional.id)
    else
      @user = User.new
    end

  end

  def create
    #Notifier.welcome(@user).deliver_now


    @user = User.new(user_params)
    if @user.save
      if(current_user.admin?)
        flash[:success] = '¡Usuario creado!'
        #welcome email
        UserMailer.welcome_email(@user).deliver_later
        redirect_to profesionales_path
      end
    else
      flash[:danger] = '¡No se pudo crear el profesional!'
      render 'new'
    end
  end

  def edit
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



  # # Before filters
  #
  # # Confirms a logged-in user.
  # def logged_in_user
  #   unless logged_in?
  #     store_location
  #     flash[:danger] = 'Es necesario loguearse.'
  #     redirect_to login_url
  #   end
  # end
  #
  # # Confirms the correct user.
  #  def correct_user
  #    @user = User.find(params[:id])
  #    redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
  #  end
  #
  #
  #   # Confirms an admin user.
  #   def admin_user
  #     redirect_to(root_url) unless current_user.admin?
  #   end

    # def has_profesional
    #   User.exists?(profesional_id: params[:profesional_id]) unless params[:profesional_id].nil
    # end
end
