class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_current_user

  # Redirects to the index after signing in
  def after_sign_in_path_for(resource)
    exercises_path
  end

  private

  def check_current_user
    if current_user.nil? && (controller_name != "sessions" && controller_name != "registrations" && controller_name != "static_pages")
      redirect_to root_path
    end
  end
end
