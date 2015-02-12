Warden.test_mode!
# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'Client Dashboard', :devise do

  after(:each) do
    Warden.test_reset!
  end


  # Scenario: Client's info listed on index page
  #   Given I am signed in
  #   When I visit the client dashboard page
  #   Then I see my information
  scenario 'view client dashboard after signin' do
    user = FactoryGirl.create(:user, :client)
    signin(user.email, user.password)
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content 'My Dashboard'
  end

  # Scenario: Client sees own dashboard
  #   Given I am signed in
  #   When I visit the client dashboard page
  #   Then I see my own email address
  scenario 'client sees own dashboard' do
    client = FactoryGirl.create(:user, :client)
    login_as(client, :scope => :user)
    visit dashboard_path
    expect(page).to have_content client.email
  end

  # Scenario: Practitioner can see own dashboard
  #   Given I am signed in
  #   When I visit the client dashboard page
  #   Then I see my own email address
  scenario 'practitioner sees own dashboard' do
    practitioner = FactoryGirl.create(:user, :practitioner)
    login_as(practitioner, :scope => :user)
    visit dashboard_path
    expect(page).to have_content practitioner.email
  end

  # Scenario: Admin sees own dashboard
  #   Given I am signed in
  #   When I visit the client dashboard page
  #   Then I see my own email address
  scenario 'admin sees own dashboard' do
    admin = FactoryGirl.create(:user, :admin)
    login_as(admin, :scope => :user)
    visit dashboard_path
    expect(page).to have_content admin.email
  end

  # Scenario: Client cannot see another client's dashboard
  #   Given I am signed in
  #   When I visit another client's dashboard
  #   Then I see an 'access denied' message
  # scenario "client cannot see another user's dashboard" #do
  #   me = FactoryGirl.create(:user, :client)
  #   other = FactoryGirl.create(:user, :client, email: 'other@example.com')
  #   login_as(me, :scope => :user)
  #   Capybara.current_session.driver.header 'Referer', root_path
  #   visit dashboard_path
  #   expect(page).to have_content 'Access denied.'
  # end



end
