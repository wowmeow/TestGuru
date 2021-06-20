class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:path) || tests_path
    else
      flash.now[:alert] = 'Неверный логин или пароль'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
