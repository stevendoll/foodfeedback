class CreateAccountService
  def call
    account = Account.find_or_create_by!(name: 'Food Feedback')
  end
end
