class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {
      |u| u.permit(:name, :address, :birth_day, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) {
      |u| u.permit(:name, :email, :address, :birth_day, :phonenumber, :password, :current_password,
        images_attributes: [:id, :picture, :imageable_id, :imageable_type, :user_id]) }
  end
end
