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

  #before_filter :update_sanitized_params, only: :update

  # # PUT /resource/invitation
  # def update
  #   respond_to do |format|
  #     format.js do
  #       invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
  #       self.resource = resource_class.where(invitation_token: invitation_token).first
  #       resource.skip_password = true
  #       resource.update_attributes update_resource_params.except(:invitation_token)
  #     end
  #     format.html do
  #       super
  #     end
  #   end
  # end


  # protected

  # def update_sanitized_params
  #   devise_parameter_sanitizer.for(:accept_invitation) do |u|
  #     u.permit(:name, :password, :password_confirmation, :invitation_token, :avatar, :avatar_cache)
  #   end
  # end

  private

  # this is called when creating invitation
  def invite_resource
    resource_class.invite!(invite_params, current_inviter) do |u|
      # set account
      u.account = current_inviter.account
    end
  end

end