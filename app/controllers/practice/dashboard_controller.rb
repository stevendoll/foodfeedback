class Practice::DashboardController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @user = current_user
    authorize :practice_dashboard

  end
end
