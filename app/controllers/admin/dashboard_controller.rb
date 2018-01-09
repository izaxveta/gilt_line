class Admin::DashboardController < Admin::BaseController
  before_action :require_admin

  def index
    @user = current_user
  end

end