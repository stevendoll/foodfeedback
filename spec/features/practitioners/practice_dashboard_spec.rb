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
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    my_client = User.where(:account => practitioner.account).first
    login_as(practitioner, scope: :user)
    visit practice_dashboard_index_path
    expect(page).to have_content my_client.email
  end

  # Scenario: User can't view clients on index page if not the practitioner
  #   Given I am signed in
  #   Given I am not a practitioner
  #   When I visit the practitioner dashboard page
  #   Then I see the email addresses of my clients
  scenario 'cant view clients if no longer a practitioner' do
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients, :role => 'client')
    my_client = User.where(:account => practitioner.account).where(:role => 'client').last
    login_as(practitioner, scope: :user)
    visit practice_dashboard_index_path
    expect(current_path).to eq('/')
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'Access denied.'
  end

  # Scenario: Account client can't view other account clients
  #   Given I am signed in
  #   Given I am a client of an account
  #   When I visit the practitioner dashboard page
  #   Then I do not see the email addresses of other account clients
  scenario 'an account client cant view another client' do
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    first_client = User.where(:account => practitioner.account).where(:role => 'client').first
    other_client = User.where(:account => practitioner.account).where(:role => 'client').last
    login_as(first_client, scope: :user)
    visit practice_dashboard_index_path
    expect(current_path).to eq('/')
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'Access denied.'
    expect(page).not_to have_content other_client.email
  end


end
