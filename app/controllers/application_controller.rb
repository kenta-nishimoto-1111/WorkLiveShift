class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_notifications

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[last_name family_name image company_name company_image])
  end

  def set_user_notifications
    return unless current_user

    @user_notifications = current_user.user_notifications.where(checked_at: nil).order(id: :desc)
  end
end
