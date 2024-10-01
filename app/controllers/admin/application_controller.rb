module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_admin_user!

    def authenticate_admin_user!
      redirect_to new_user_session_path unless admin_user_signed_in?
    end

    def current_active_admin_user
      current_admin_user
    end
  end
end
