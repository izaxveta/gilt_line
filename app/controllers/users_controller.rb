class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

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

  def edit; end

  def update
    if user.update(user_params)
      set_user_labels(params[:user][:label_ids], user)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private
    attr_reader :user

    def set_user
      @user = current_user
    end

    def set_user_labels(data, user)
      UserLabel.set_favorite_labels(data, user)
    end

    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :password,
                                   :birthday,
                                   :nationality,
                                   :occupation,
                                   :avatar,
                                   :moniker)
    end
end