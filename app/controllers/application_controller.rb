class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?  

  protected


  def authenticate_admin!
    return if current_user && current_user.admin
    flash[:alert] = "Unauthorized :("
    redirect_to dashboard_path
  end


  private

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :first_name, :last_name, :facebook_handle, :twitter_handle, :github_handle, :personal_website, :mobile_number, :uid, :provider, :application_reasons, :package, :phone])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :current_password, :name, :avatar, :facebook_handle, :twitter_handle, :github_handle, :personal_website, :mobile_number, :phone])
	end
end
