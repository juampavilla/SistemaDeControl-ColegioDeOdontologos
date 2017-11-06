class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

 def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "¡Bienvenido a SACO!"
      #redirect_to @user
      redirect_to profesionales_path
    else
      render 'new'
    end
 end

 def edit
   @user = User.find(params[:id])
 end

  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
