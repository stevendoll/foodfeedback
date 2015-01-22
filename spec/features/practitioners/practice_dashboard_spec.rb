Warden.test_mode!
# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'Practice Dashboard', :devise do

  after(:each) do
    Warden.test_reset!
  end


  # Scenario: Practitioner's clients listed on index page
  #   Given I am signed in
  #   When I visit the practitioner dashboard page
  #   Then I see the email addresses of my clients
  scenario 'view practice dashboard after signin' do
    user = FactoryGirl.create(:user, :practitioner)
    signin(user.email, user.password)
    expect(current_path).to eq('/practice/dashboard/index')
    expect(page).to have_content 'Practice Dashboard'
  end

  # Scenario: Practitioner's clients listed on index page
  #   Given I am signed in
  #   When I visit the practitioner dashboard page
  #   Then I see the email addresses of my clients
  scenario 'view my practice clients' do
    user = FactoryGirl.create(:user, :practitioner)
    my_client = FactoryGirl.create(:user, :client, email: 'my_client@example.com')
    login_as(user, scope: :user)
    visit practice_dashboard_index_path
    expect(page).to have_content my_client.email
  end

  # Scenario: Other practitioner's clients not listed on index page
  #   Given I am signed in
  #   When I visit the practitioner dashboard page
  #   Then I do not see the email addresses of other clients
  scenario 'do not view other practice clients' do
    user = FactoryGirl.create(:user, :practitioner)
    other_client = FactoryGirl.create(:user, :client, email: 'other_client@example.com')
    login_as(user, scope: :user)
    visit practice_dashboard_index_path
    expect(page).not_to have_content other_client.email
  end


end
