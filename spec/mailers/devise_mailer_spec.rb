require "rails_helper"

RSpec.describe Devise::Mailer, :type => :mailer do

  describe 'invite new client' do

    let(:practitioner) { FactoryGirl.create(:user, :practitioner) } 
    let(:potential_client) { FactoryGirl.create(:user, :client) } 
    let(:mail) { Devise::Mailer.invitation_instructions(potential_client, practitioner) }

    it 'should have correct subject' do
      expect(mail.subject).to have_content('Invitation instructions')
    end

    it 'should have correct from: address' do
      expect(mail.from).to eq [ 'no-reply@foodfeedback.herokuapp.com' ]
    end
   
    it 'should have correct to: address' do
      expect(mail.to).to eq [potential_client.email]
    end
   
    it "should have potential client's name in the heading" do
      expect(mail.body.encoded).to have_selector('h2', potential_client.first_name)
    end
   
    it "should have post creator's name in the body" do
      expect(mail.body.encoded).to have_content(practitioner.first_name)
    end
   
    # it 'should have link to accept the invitation' do
    #   # to be updated when confirmation links are implemented
    #   #confirmation_url = 'http://example.com/posts/' + post.id + '/feature'
    #   respond_url = accept_invitation_url(potential_client, :invitation_token => potential_client.invitation_token)
    #   expect(mail.body.encoded).to have_link(respond_url)
    # end


  end

end
