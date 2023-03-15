require "rails_helper"

RSpec.describe "/", type: :request do
  describe "GET /register" do
    xit "load sign up page for anonymous users" do
      get register_path
      expect(response).to have_http_status(:ok)
    end
  end
end
