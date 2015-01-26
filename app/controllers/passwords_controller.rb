class PasswordsController < Devise::PasswordsController
  
  # redirect an unconfirmed user if trying to change password

  # POST /resource/password
  def create
    
    self.resource = resource_class.find_by_email(resource_params[:email])
    
    # user doesn't exist
    if resource.nil?
      set_flash_message(:notice, :not_found) if is_flashing_format?
      redirect_to new_user_registration_path
      return
    end

    unless resource && resource.confirmed?
      set_flash_message(:notice, :unconfirmed) if is_flashing_format?
      redirect_to new_confirmation_path(:user)
      return
    end

    super
  end

end