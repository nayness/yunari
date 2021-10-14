class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    characters_path
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :alias, :lastname])
  end
end
