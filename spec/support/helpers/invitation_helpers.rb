module Features
  module InvitationHelpers

    def invite_client(email)
      visit new_user_invitation_path
      fill_in 'Email', with: email
      click_button 'Send an invitation'
    end

    # def accept_invitation(user)
    #   encrypted_invitation_token = user.invitation_token
    #   accept_invitation_url = 'http://example.com/invitation/accept?invitation_token=' + user.invitation_token
    #   visit accept_invitation_url


    #   visit new_user_invitation_path
    #   fill_in 'Email', with: email
    #   click_button 'Send an invitation'

    #   raw, enc = Devise.token_generator.generate(self.class, :invitation_token)
    #   @raw_invitation_token = raw
    #   self.invitation_token = enc

    # new_client = User.find_by_email('invitee_2@mail.com')
    # puts new_client.invitation_token
    # accept_invitation_url = 'http://example.com/invitation/accept?invitation_token=' + new_client.raw_invitation_token
    # visit accept_invitation_url


    # end


  end
end
