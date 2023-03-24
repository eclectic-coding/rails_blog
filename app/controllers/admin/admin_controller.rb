class Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def index
    @user = current_user if current_user.admin?
    authorize @user
  end
end
