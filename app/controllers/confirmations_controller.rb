class ConfirmationsController < Devise::ConfirmationsController

  def send_confirmation_instructions
    send_confirmation_instructions unless current_user.email == 'steven@kichocheo.com'
  end

end
