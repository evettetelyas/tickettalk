# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys:
                                      %i[email username first_name last_name])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys:
                                      %i[email username first_name last_name paypal_me])
  end

  def action_missing(m, *args, &block)
    Rails.logger.error(m)
    redirect_to '/'
    flash[:error] = "Sorry the page your looking for doesn't exsist"
  end
end
