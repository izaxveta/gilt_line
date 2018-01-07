class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Sign in successful."
      redirect_to dashboard_path(id: user.id)
    else
      flash[:notice] = "Input invalid."
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end