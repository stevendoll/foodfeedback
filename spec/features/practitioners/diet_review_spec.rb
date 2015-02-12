# Feature: View client food choices
#   As a practioner
#   I want to view clients food records
#   So I can make recommendations
feature 'Practioner Diet Review' do

  scenario 'practioner can view client food records'

  scenario 'practioner can not view food records of other clients'

end

Warden.test_mode!
# Feature: View client food choices
#   As a practioner
#   I want to view clients food records
#   So I can make recommendations
feature 'Practioner Diet Review' do


  after(:each) do
    Warden.test_reset!
  end


  # Scenario: Practitioner can see client's info on practice / user / show page
  #   Given I am signed in
  #   And I am a practitioner
  #   And a user is my client
  #   When I visit the client practice page
  #   Then I see the client information
  scenario 'practioner can view client food records' do
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    my_client = User.where(:account => practitioner.account).first
    login_as(practitioner, scope: :user)
    visit practice_client_path(my_client)
    expect(page).to have_content my_client.full_name
  end


  # Scenario: Practitioner can see client's info on practice / user / show page
  #   Given I am signed in
  #   And I am a practitioner
  #   And a user is not my client
  #   When I visit the client practice page
  #   Then I see a "access denied" message
  scenario 'practioner can not view food records of other clients' do
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    another_practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    other_client = User.where(:account => another_practitioner.account).first
    login_as(practitioner, scope: :user)
    visit practice_client_path(other_client)
    expect(page).to have_content 'Access denied.'
  end




end