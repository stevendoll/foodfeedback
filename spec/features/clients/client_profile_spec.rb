include Warden::Test::Helpers
Warden.test_mode!

# Feature: Client profile page
#   As a client
#   I want to visit my client profile page
#   So I can see my personal account data
feature '85376384 Client profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Client sees own profile
  #   Given I am signed in
  #   When I visit the client profile page
  #   Then I see my own email address
  scenario 'client sees own profile' do
    client = FactoryGirl.create(:user, :client)
    login_as(client, :scope => :user)
    visit dashboard_path
    expect(page).to have_content 'Profile'
    expect(page).to have_content client.email
  end

  # Scenario: Client cannot see another client's profile
  #   Given I am signed in
  #   When I visit another client's profile
  #   Then I see an 'access denied' message
  scenario "client cannot see another client's profile" do
    me = FactoryGirl.create(:user, :client)
    other = FactoryGirl.create(:user, :client, email: 'other@example.com')
    login_as(me, :scope => :user)
    visit dashboard_path
    expect(page).to have_content me.email
    Capybara.current_session.driver.header 'Referer', root_path
    visit user_path(other)
    expect(page).to have_content 'Access denied.'
  end

end
