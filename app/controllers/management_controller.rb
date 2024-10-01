class ManagementController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_moderator

  def index
    # Lógica para la vista de management
  end

  private

  def authorize_moderator
    redirect_to root_path, alert: "No tienes permiso para acceder a esta sección." unless current_user.has_role?(:moderator)
  end
end
