# Feature: Invite clients
#   As a practioner
#   I want to invite clients
#   So they can use the application
feature '85376400 Invite clients', :devise do

  scenario 'practioner can invite clients' do
    practitioner = FactoryGirl.create(:user, :practitioner)
    login_as(practitioner, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit new_user_invitation_path
    fill_in 'Email', :with => 'newemail@example.com'
    click_button 'Send an invitation'
    expect(page).to have_content 'An invitation email has been sent to'
  end

  scenario 'invite sends an email' do
    practitioner = FactoryGirl.create(:user, :practitioner)
    login_as(practitioner, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit new_user_invitation_path
    fill_in 'Email', :with => 'email_to@mail.com'
    click_button 'Send an invitation'
    potential_client = user = User.find_by_email('email_to@mail.com')
    expect(page).to have_content 'An invitation email has been sent to'
    expect(potential_client.send(:send_confirmation_notification?))
  end

  scenario 'client can not invite clients' do
    client = FactoryGirl.create(:user, :client)
    login_as(client, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit new_user_invitation_path
    expect(page).to have_content 'Access denied.'
  end

  scenario 'practitioner can see invitees pending'

  scenario 'practitioner can see invitees after accepting'

end
