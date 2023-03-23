class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :update]
  layout "admin", only: [:edit]

  def new
    @user = User.new
  end

  def edit
    @user = current_user
    @active_sessions = @user.active_sessions.order(created_at: :desc)
  end

  def update
    @user = current_user
    @active_sessions = @user.active_sessions.order(created_at: :desc)
    if @user.authenticate(params[:user][:current_password])
      if @user.update(update_user_params)
        if params[:user][:unconfirmed_email].present?
          @user.send_confirmation_email!
          redirect_to root_path, notice: t(".instructions")
        else
          redirect_to root_path, notice: t(".updated")
        end
      else
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:error] = t(".invalid_password")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    reset_session
    redirect_to root_path, notice: t(".deleted")
  end

  private

  def update_user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation, :unconfirmed_email)
  end
end
