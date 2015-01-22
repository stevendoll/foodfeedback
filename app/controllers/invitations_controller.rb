class InvitationsController < Devise::InvitationsController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def new
    authorize :invitation
    super
  end

  def create
    authorize :invitation
    super
  end

  def edit
    authorize :invitation
    super
  end

  def update
    authorize :invitation
    super
  end

  def destroy
    authorize :invitation
    super
  end


  private
end