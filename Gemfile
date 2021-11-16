source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth'
gem 'google-api-client', require: ['google/apis/calendar_v3', 'googleauth']
gem 'lockbox'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.19'
  gem 'httplog'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'webmock'
end
