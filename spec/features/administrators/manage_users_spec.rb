include Warden::Test::Helpers
Warden.test_mode!

# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
feature 'Administrator can modify and delete users', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Administrator can delete user
  #   Given I am signed in
  #   And I am an administrator
  #   When I delete a user account
  #   Then I should see an account deleted message
  scenario 'administrator can delete user' do
    admin = FactoryGirl.create(:user, :admin)
    client = FactoryGirl.create(:user, :client)
    signin(admin.email, admin.password)
    visit user_path(client)
    click_link 'Delete user'
    expect(page).to have_content 'User deleted.'
  end

  # Scenario: Client can not delete a client
  #   Given I am signed in
  #   And I am a client
  #   When I go to another client's show page
  #   Then I should see an access denied message
  scenario 'client can not delete user' do
    user = FactoryGirl.create(:user, :client)
    client = FactoryGirl.create(:user, :client)
    signin(user.email, user.password)
    visit user_path(client)
    expect(page).to have_content 'Access denied.'
  end


end