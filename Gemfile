source 'https://rubygems.org'
ruby '2.1.5'
gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'bootstrap-sass'
gem 'devise'
gem 'devise_invitable'
gem 'high_voltage'
gem 'pg'
gem 'pundit'
gem 'simple_form'
gem 'unicorn'
gem 'unicorn-rails'

# oauth
# gem 'omniauth'
# gem 'omniauth-twitter'
# gem 'omniauth-facebook'
# gem 'omniauth-linkedin'

gem 'fatsecret-omniauth'

# added gems
gem 'font-awesome-rails'
# gem 'icheck-rails' # https://github.com/cubus/icheck-rails customized checkboxes and radio buttons with JQuery
gem 'simple_token_authentication'
gem 'attribute_normalizer'

gem 'gibbon' #mailchimp list

gem "paperclip"
gem 'aws-sdk'

gem 'acts-as-taggable-on'
gem 'will_paginate'

gem 'pushmeup' #push notifications
gem 'twilio-ruby' #sms

# memory logging
gem 'oink'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
end
group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm' #added
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
