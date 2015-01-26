# Feature: Practitioner Sign up
#   As a practitioner
#   I want to sign up
#   So I can visit protected areas of the site
feature 'Practitioner Sign Up', :devise do

  # Scenario: Practitioner can sign up with valid email address and password
  #   Given I am not signed in
  #   When I sign up with a valid email address and password
  #   Then I see a successful sign up message
  scenario 'practitioner can sign up with valid email address, password and account' do
    practitioner_sign_up_with('test1@example.com', 'please123', 'please123', 'my account')
    txts = [I18n.t( 'devise.registrations.signed_up'), I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  # Scenario: Practitioner cannot sign up without account
  #   Given I am not signed in
  #   When I sign up without an account
  #   Then I see a missing account message
  scenario 'practitioner cannot sign up without account' do
    practitioner_sign_up_with('test2@example.com', 'please123', 'please123', '')
    expect(page).to have_content "Account name can't be blank"
  end

  # Scenario: Practitioner cannot sign up with invalid email address
  #   Given I am not signed in
  #   When I sign up with an invalid email address
  #   Then I see an invalid email message
  scenario 'practitioner cannot sign up with invalid email address' do
    practitioner_sign_up_with('bogus', 'please123', 'please123', 'my account')
    expect(page).to have_content 'Email is invalid'
  end

  # Scenario: Practitioner cannot sign up without password
  #   Given I am not signed in
  #   When I sign up without a password
  #   Then I see a missing password message
  scenario 'practitioner cannot sign up without password' do
    practitioner_sign_up_with('test3@example.com', '', '', 'my account')
    expect(page).to have_content "Password can't be blank"
  end

  # Scenario: Practitioner cannot sign up with a short password
  #   Given I am not signed in
  #   When I sign up with a short password
  #   Then I see a 'too short password' message
  scenario 'practitioner cannot sign up with a short password' do
    practitioner_sign_up_with('test4@example.com', 'please', 'please', 'my account')
    expect(page).to have_content "Password is too short"
  end

  # Scenario: Practitioner cannot sign up without password confirmation
  #   Given I am not signed in
  #   When I sign up without a password confirmation
  #   Then I see a missing password confirmation message
  scenario 'practitioner cannot sign up without password confirmation' do
    practitioner_sign_up_with('test5@example.com', 'please123', '', 'my account')
    expect(page).to have_content "Password confirmation doesn't match"
  end

  # Scenario: Practitioner cannot sign up with mismatched password and confirmation
  #   Given I am not signed in
  #   When I sign up with a mismatched password confirmation
  #   Then I should see a mismatched password message
  scenario 'practitioner cannot sign up with mismatched password and confirmation' do
    practitioner_sign_up_with('test6@example.com', 'please123', 'mismatch', 'my account')
    expect(page).to have_content "Password confirmation doesn't match"
  end

end
