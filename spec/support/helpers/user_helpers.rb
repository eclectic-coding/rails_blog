module Helpers
  module Authentication
    def login(user, remember_user: nil)
      post login_path, params: {
        user: {
          email: user.email,
          password: user.password,
          remember_me: (remember_user == true) ? 1 : 0
        }
      }
    end

    def current_user
      if session[:current_active_session_id].present?
        ActiveSession.find_by(id: session[:current_active_session_id])&.user
      else
        cookies[:remember_token].present?
        ActiveSession.find_by(remember_token: cookies[:remember_token])&.user
      end
    end

    def logout
      session.delete(:current_active_session_id)
    end
  end
end
