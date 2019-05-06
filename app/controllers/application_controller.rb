# application controller
class ApplicationController < ActionController::Base

  add_flash_types :success, :error

  before_action :configure_permitted_parameters, if: :devise_controller?
private

  def after_sign_in_path_for(user)
    projects_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :fundraiser, :country, :city])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :fundraiser, :country, :city, :email, :password, :current_password])
  end
end
