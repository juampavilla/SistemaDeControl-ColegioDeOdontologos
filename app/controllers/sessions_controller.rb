class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      #redirect_to user
      #redirect_to profesionales_path
      redirect_back_or @user
    else
      # Create an error message.
      flash.now[:danger] = 'Combinación de email/password inválida'
      render 'new'
    end
  end

  def destroy;
    log_out if logged_in?
    redirect_to root_url
  end
end
