source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.6"

gem "rails", "~> 6.1.4", ">= 6.1.4.1"

# Basic
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '~> 6.4'
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "pagy", "~> 6.0", ">= 6.0.4"
gem "cpf_cnpj", "~> 0.5.0"
gem "validators", "~> 3.4", ">= 3.4.1"
gem "simple_form", "~> 5.1"
gem "time_difference"
gem "ransack"

# Optimization
gem 'bootsnap', '~> 1.16'

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
  gem "factory_bot_rails", "~> 6.2"
  gem "faker"
  gem "rspec-rails", "~> 5.0", ">= 5.0.2"
  gem "shoulda-matchers", "~> 4.0"
  gem "pry"
  gem "pry-rails"
  gem "awesome_print"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "simplecov", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
