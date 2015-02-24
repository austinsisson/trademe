class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  protected
  
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, notice: 'You need to sign in or sign up before continuing.'
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
