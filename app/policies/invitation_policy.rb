class InvitationPolicy < Struct.new(:user, :invitation)
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @invitation = model
  end

  def new?
    @current_user.admin? or @current_user.practitioner?
  end

  def create?
    @current_user.admin? or @current_user.practitioner?
  end

  def edit?
    # invited user needs to reply
  end

  def update?
    # invited user needs to reply
  end

  def destroy?
    return false if @current_user == @user or @current_user.practitioner?
    @current_user.admin?
  end

end
