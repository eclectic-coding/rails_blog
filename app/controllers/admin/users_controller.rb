class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def update
  end

  def edit
  end

  def destroy
  end
end
