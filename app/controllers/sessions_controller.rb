class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Sign in successful!'
      redirect_to dashboard_path(id: user.id)
    else
      render :new
    end
  end
end