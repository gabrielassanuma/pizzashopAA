class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_current_cart

  private
    def set_current_cart
      @current_cart = if session[:cart_id]
                        Cart.find_by(id: session[:cart_id]) || create_new_cart
                      else
                        create_new_cart
                      end
    end
    
    def create_new_cart
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:phone_number, :username, :address, :additional_info, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:phone_number, :username, :address, :additional_info, :email, :password, :current_password) }
  end

end
