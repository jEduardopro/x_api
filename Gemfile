source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"
gem "rails", "~> 7.0.7"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "sidekiq"
gem "discard", "~> 1.2"
gem "interactor", "~> 3.0"
gem "jwt"
gem "kaminari"
gem 'config', "~> 4.2.0" # handle environment specific settings
gem "bcrypt", "~> 3.1.7"
gem "rest-client"
gem 'active_model_serializers', '~> 0.10.0'
gem "rack-cors", require: "rack/cors"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
	gem "rspec-rails"
	gem "rspec-json_expectations"
	gem "factory_bot_rails"
	gem "faker"
	gem "pry-rails"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
	gem 'shoulda-matchers'
	gem 'database_cleaner'
end

