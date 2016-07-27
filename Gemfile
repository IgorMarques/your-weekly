source "https://rubygems.org"

ruby "2.3.1"

gem "pg"
gem "rails", "~> 5.0.0"
gem 'puma'
gem 'rack-mini-profiler'
gem 'rubocop', require: false
gem 'webpack-rails'
gem 'foreman'
gem 'sidekiq'

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "binding_of_caller"
  gem "better_errors"
end

group :development, :test do
  gem 'brakeman', require: false
  gem "bullet"
  gem 'listen'
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5.1"
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'poltergeist'
end

group :staging, :production do
  gem 'rails_12factor'
end
