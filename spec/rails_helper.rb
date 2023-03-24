require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "capybara/rails"
require "fuubar"
require "webmock/rspec"


Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /secure.gravatar.com/).to_return(status: 200, body: "", headers: {})
  end
  config.include FactoryBot::Syntax::Methods
  config.include Rails.application.routes.url_helpers, type: :request
  config.include Helpers::Authentication, type: :request
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.fuubar_progress_bar_options = {format: "Completed Tests <%B> %p%% %a"}
end
