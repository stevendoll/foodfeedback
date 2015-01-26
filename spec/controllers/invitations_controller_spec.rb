require 'rails_helper'

RSpec.describe InvitationsController, :type => :controller do


  # let(:new_client) { FactoryGirl.create(:user, :unconfirmed) } 
  
  # describe "Setup Customer after invite (test what is not tested in invitable plugin)" do
  #     before do
  #       new_client.invite!
  #       accept_user_invitation_path(new_client, invitation_token: new_client.raw_invitation_token)
  #       fill_in "Password", with: "password"
  #       fill_in "Password confirmation", with: "password"
  #       #fill_in "User name", with: "new user name"
  #       click_button "Set my password"
  #     end
      
  #     it { expect(new_client.reload.password).to eq("password")}
  #   end
end
