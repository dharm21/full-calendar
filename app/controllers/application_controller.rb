class ApplicationController < ActionController::Base
	 # before_action :authenticate_user!
	 before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :mobile_no, :address])
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :mobile_no, :password])
  end
end
