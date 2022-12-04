class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:phone_number, :username, :street_name, :house_number, :additional_info, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:phone_number, :username, :street_name, :house_number, :additional_info, :email, :password, :current_password) }
  end
end
