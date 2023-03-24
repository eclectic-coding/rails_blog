require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "get login if anonymous" do
      get login_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "successful login features" do
    it "redirects from login if authenticated" do
      user = create(:user)
      login user

      expect(response).to redirect_to(admin_root_path)
    end

    it "logins and create active session if confirmed" do
      user = create(:user)
      login user

      expect(response).to redirect_to(admin_root_path)
      expect(current_user).to eq(user)
    end
  end
end
