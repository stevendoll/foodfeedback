class PracticeClientPolicy < Struct.new(:user, :practice_client)
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @client = model
  end

  def index?
    @current_user.admin? or @current_user.practitioner?
  end

  def show?
    #@current_user.admin? or (@current_user.practitioner? and @current_user.account == @client.account)
  end

  def edit?
    @current_user.admin? or @current_user.practitioner?
  end

  def update?
    @current_user.admin? or @current_user.practitioner?
  end


end
