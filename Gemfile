source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

eval_gemfile "config/gems/app.rb"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "image_processing", ">= 1.2"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "web-console"
end
