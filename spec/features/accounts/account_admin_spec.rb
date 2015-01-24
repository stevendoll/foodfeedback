# Feature: Accounts with multiple practioners
#   As a practioner
#   I want to create an account
#   So I can arrange preferences and billing
feature 'Administration for accounts' do

  # future
  scenario 'administrator can change a practioners account'

  scenario 'administrator can change a clients account'

  scenario 'client cannot view account management'

  scenario 'practitioner can view account management'

  scenario 'practitioner cannot view other accounts'

  scenario 'practitioner cannot assign client to other account'

  # Scenario: Administrator can view accounts
  #   Given I am signed in
  #   Given I am an administrator
  #   When I visit the accounts page
  #   Then I see the names of accounts
  scenario 'administrator can view accounts' do
    administrator = FactoryGirl.create(:user, :admin)
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    client = User.where(:account => practitioner.account).where(:role => 'client').first
    login_as(administrator, scope: :user)
    visit accounts_path
    expect(page).to have_content practitioner.account.name
  end

  # Scenario: Practitioner cannot view accounts
  #   Given I am signed in
  #   Given I am an practitioner
  #   When I visit the accounts page
  #   Then I see an access denied message
  scenario 'practitioner cannot view accounts' do
    administrator = FactoryGirl.create(:user, :admin)
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    client = User.where(:account => practitioner.account).where(:role => 'client').first
    login_as(practitioner, scope: :user)
    visit accounts_path
    expect(page).to have_content 'Access denied.'
  end

  # Scenario: Client cannot view accounts
  #   Given I am signed in
  #   Given I am an client
  #   When I visit the accounts page
  #   Then I see an access denied message
  scenario 'client cannot view accounts' do
    administrator = FactoryGirl.create(:user, :admin)
    practitioner = FactoryGirl.create(:user, :practitioner_with_clients)
    client = User.where(:account => practitioner.account).where(:role => 'client').first
    login_as(client, scope: :user)
    visit accounts_path
    expect(page).to have_content 'Access denied.'
  end


end