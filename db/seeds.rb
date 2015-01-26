# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
account = CreateAccountService.new.call
puts 'CREATED ADMIN ACCOUNT: ' << account.name

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Environment variables (ENV['...']) can be set in the file .env file.

# puts 'ACCOUNTS'
# foodfeedback = Account.create(:name => 'Food Feedback')

# puts 'ADMINISTRATORS'
# user = User.create(:email => 'steven@kichocheo.com', :first_name => 'Steven', :last_name => 'Doll', :phone => '202-267-9909', :title => '', :account_id => foodfeedback)
# puts 'user: ' << user.first_name
# user.password = Rails.application.secrets.admin_password
# user.password_confirmation = Rails.application.secrets.admin_password
# user.confirm!
# user.admin!
# user.save

# puts 'ADD CREATOR TO ADMINISTRATOR ACCOUNT'
# foodfeedback.creator = user
# foodfeedback.save