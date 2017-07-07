class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    if current_user
      redirect_to root_path unless current_user.admin?
    else
      redirect_to new_user_session_path
    end
  end
  
  def admin_access_denied
    redirect_to sign_in_path
  end

  # HELPERS
  # user_signed_in?
  # current_user
  # user_session
  
  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end
  
  def after_sign_out_path_for(resource_name)
    new_user_session_path
  end
  
  private
  
  def after_sign_in_path
    root_path
  end

  
  def handle_routing_error
    redirect_to root_path, alert: "This is some kind of trickery !"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  # DEFAULT PERMITTED PARAMETERS BY DEVISE
  # sign_in (Devise::SessionsController#create) - Permits only the authentication keys (like email)
  # sign_up (Devise::RegistrationsController#create) - Permits authentication keys plus password and password_confirmation
  # account_update (Devise::RegistrationsController#update) - Permits authentication keys plus password, password_confirmation and current_password
end
