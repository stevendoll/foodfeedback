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
    fill_in 'Email', :with => 'invitee_1@mail.com'
    click_button 'Send an invitation'
    potential_client = User.find_by_email('invitee_1@mail.com')
    expect(page).to have_content 'An invitation email has been sent to'
    expect(potential_client.send(:send_confirmation_notification?))
  end

  scenario 'invitee account is set to practitioner account' do
    practitioner = FactoryGirl.create(:user, :practitioner)
    login_as(practitioner, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit new_user_invitation_path
    fill_in 'Email', :with => 'invitee_1@mail.com'
    click_button 'Send an invitation'
    potential_client = User.find_by_email('invitee_1@mail.com')

    expect(potential_client.account).not_to be_nil
    expect(potential_client.account.name).to eq("account_name")
  end

  scenario 'client can not invite clients' do
    client = FactoryGirl.create(:user, :client)
    login_as(client, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit new_user_invitation_path
    expect(page).to have_content 'Access denied.'
  end

  # Scenario: Client responds to invitation link
  #   Given I exist as a invitee
  #   And I am not signed in
  #   And I am not confirmed
  #   When I click on the invitation link
  #   Then I see a set password form
  scenario 'client responds to invitation link to set password' do
    new_client = FactoryGirl.create(:user, :unconfirmed)
    new_client.invite!
    visit accept_user_invitation_path(new_client, invitation_token: new_client.raw_invitation_token)
    expect(page).to have_content 'Password'
  end

  # Scenario: Client tries to login before responding to invitation
  #   Given I exist as a invitee
  #   And I am not signed in
  #   And I am not confirmed
  #   When I try to sign in
  #   Then I see an invitation not completed message
  scenario 'invited client sees invalid message if trying to log in' do
    new_client = FactoryGirl.create(:user, :unconfirmed)
    new_client.invite!
    signin(new_client.email, 'some_password')
    expect(page).to have_content 'Invalid email or password.'
  end

  # Scenario: Client tries to login before responding to invitation
  #   Given I exist as a invitee
  #   And I am not signed in
  #   And I am not confirmed
  #   When I try to sign in
  #   Then I see an invitation not completed message
  scenario 'invited client sees invitation message if trying to log in' #do
  #   new_client = FactoryGirl.create(:user, :unconfirmed)
  #   new_client.invite!
  #   signin(new_client.email, 'some_password')
  #   expect(page).to have_content I18n.t 'devise.failure.invited'
  # end

  # Scenario: Client responds to invitation link
  #   Given I exist as a invitee
  #   And I am not signed in
  #   And I am not confirmed
  #   When I click on the invitation link
  #   Then I see a set password form
  scenario 'client can respond to invitation link, set password and log in' do
    new_client = FactoryGirl.create(:user, :unconfirmed)
    new_client.invite!
    visit accept_user_invitation_path(new_client, invitation_token: new_client.raw_invitation_token)

    fill_in 'Password', :with => 'my_password'
    fill_in 'Password confirmation', :with => 'my_password'
    click_button "Set my password"

    expect(page).to have_content I18n.t 'devise.invitations.updated'
    expect(page).to have_content 'My Dashboard'
  end


  scenario 'practitioner can see invitees pending'

  scenario 'practitioner can see invitees after accepting'

end
