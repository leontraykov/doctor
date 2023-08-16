source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Core
gem "rails", "~> 7.0.7"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# Assets & Frontend
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"

# Development tools
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'capistrano', '~> 3.14'
  gem 'capistrano-rails', '~> 1.6'
  gem 'capistrano-rbenv', git: 'https://github.com/capistrano/rbenv.git', require: false
  gem 'capistrano3-puma', require: false
  # gem "rack-mini-profiler"
  # gem "spring"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# External APIs
gem "ruby-openai", "~> 4.3"
gem "neighbor", "~> 0.3.0"

# Other commented-out gems
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
# gem "sassc-rails"
# gem "image_processing", "~> 1.2"
