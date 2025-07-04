class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :terms_of_service])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Acesso negado."
    end
  end
end 