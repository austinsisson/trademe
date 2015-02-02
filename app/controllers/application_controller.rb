class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
