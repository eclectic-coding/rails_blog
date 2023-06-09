class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  before_action :authenticate_user!, only: [:destroy]

  def create
    @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
    if @user
      if @user.admin?
        after_login_path = session[:user_return_to] || admin_root_path
        active_session = login @user
        remember(active_session) if params[:user][:remember_me] == "1"
        redirect_to after_login_path, notice: t(".sign_up")
      else
        flash.now[:alert] = t(".incorrect_flash")
        forget_active_session
        redirect_to root_path
      end
    else
      flash.now[:alert] = t(".incorrect_flash")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    forget_active_session
    logout
    redirect_to root_path, notice: t(".sign_out")
  end

  def new
  end
end
