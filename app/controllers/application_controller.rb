class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(resource)
    flash[:signup] = "successfully"
    user_path(current_user)
  end
  def after_sign_in_path_for(resource)
    flash[:signin] = "successfully"
    user_path(current_user)
  end
  def after_sign_out_path_for(resource)
    flash[:logout] = "successfully"
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
