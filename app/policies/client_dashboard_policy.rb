class ClientDashboardPolicy < Struct.new(:user, :client_dashboard)
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @dashboard = model
  end

  def index?
    #@current_user.admin? or @current_user.client?
    true
  end

end
