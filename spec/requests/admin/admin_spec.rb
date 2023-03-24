require "rails_helper"

RSpec.describe "Admin::Admins", type: :request do
  describe "GET /index" do
    it "returns http success" do
      login create(:user)
      get admin_root_path
      expect(response).to have_http_status(:success)
    end
  end
end
