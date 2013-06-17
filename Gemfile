source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'mail'
gem 'newrelic_rpm'
gem 'google-analytics-rails'
gem 'bcrypt-ruby'
gem "cancan"
gem "letter_opener", group: :development

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'guard-spork'
  gem 'spork'
  gem 'debugger'
end

group :test do

  gem 'factory_girl_rails'
  gem 'rb-fsevent', :require => false
  gem 'growl'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
  gem 'haml-rails'
end

gem 'jquery-rails'

group :production do
  gem 'pg'
end