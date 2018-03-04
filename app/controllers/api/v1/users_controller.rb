class Api::V1::UsersController < Api::V1::ApplicationController

  def index
    render status: 200, json: User.all
  end

  def show
    user = User.find_by(moniker: params[:moniker])
    render status: 200, json: {
      user: user,
      favorite_labels: user.labels
    }
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: 201, json: {
        message: "Successfully created #{user.full_name}",
        user: user
      }
    else
      render status: 400, json: {
        message: "Invalid request"
      }
    end
  end

  def update
    user = User.find_by(moniker: params[:moniker])
    if user.update(user_params)
      render status: 202, json: {
        message: "Successfully updated #{user.full_name}",
        user: user
      }
    else
      render status: 404
    end
  end

  private

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