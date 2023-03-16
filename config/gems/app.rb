gem "bcrypt"
gem "rails_mvp_authentication"
gem "aws-sdk-s3"
gem "redcarpet"

group :development, :test do
  gem "standard", "~> 1.9", require: false
  gem "capybara"
  gem "webdrivers"
  gem "rspec-rails", "~> 6.0.0"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "fuubar", "~> 2.5", ">= 2.5.1"
  gem "guard"
  gem "guard-rspec"
  gem "rubocop"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec"
  gem "letter_opener"
  gem "bullet"
end

group :test do
  gem "simplecov", "~> 0.21.2", require: false
end
