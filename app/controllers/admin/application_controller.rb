module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_admin_user!

    def authenticate_admin_user!
      redirect_to new_user_session_path unless admin_user_signed_in?
    end

    def after_sign_in_path_for(resource)
      if current_user.has_role?(:moderator)
        new_transaction_path  # Redirige a la página de transacciones si es moderador
      else
        root_path  # Si no es moderador, redirige a la página de inicio
      end
    end

    def current_active_admin_user
      current_admin_user
    end
  end
end
