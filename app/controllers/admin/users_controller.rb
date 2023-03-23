class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    authorize!
  end

  def edit
    authorize!
  end

  def destroy
    authorize!
  end
end
