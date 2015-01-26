class InvitationsController < Devise::InvitationsController
  before_filter :authenticate_user!, only: [:new, :create]
  after_action :verify_authorized, only: [:new, :create]

  def new
    authorize :invitation
    super
  end

  def create
    authorize :invitation
    super
  end

  private
end