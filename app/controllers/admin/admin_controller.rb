class Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  verify_authorized

  def index
    authorize!
  end
end
