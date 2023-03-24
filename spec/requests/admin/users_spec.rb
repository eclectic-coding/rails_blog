require "rails_helper"

RSpec.describe "Admin::Users", type: :request do
  let(:user) { create(:user) }

  before do
    login user
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_admin_user_path(:user)
      expect(response).to have_http_status(:success)
    end
  end
end
