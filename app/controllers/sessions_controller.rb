class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      render_flash
      redirect_user(user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def redirect_user(user)
      redirect_to admin_dashboard_path if user.admin?
      redirect_to dashboard_path(id: user.id) if user.default?
    end

    def render_flash
      flash[:success] = 'Sign in successful!'
    end
end