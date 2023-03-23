require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/admin/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admin/users/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
