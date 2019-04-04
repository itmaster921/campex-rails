class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, only: [:ccavResponseHandler]

  before_action :authenticated?
  before_action :allowed?

  helper_method :current_user
  helper_method :logged_in?

  private

  def current_user
    if session[:user_id]
      if session[:user_type] == "student"
        @current_user ||= Student.find(session[:user_id])
      end
    end
  end

  def logged_in?
    return current_user.present?
  end

  def authenticated?
    if params[:controller] == 'sessions' and ['new', 'create'].include? params[:action]
      redirect_to dashboard_index_url if logged_in?
    else
      redirect_to root_url unless logged_in?
    end
  end

  def allowed?
    return true unless params[:controller] == 'dashboard'
    return true if params[:action] == "update_menu" || params[:action] == "index" || params[:action]  == "submission_done" || params[:action] == "generate_application_pdf"
    return true if params[:action] == "photo_upload" and current_user.payment_made 

    position = RegistrationStep.find_by_action(params[:action]).position - 1
    redirect_to dashboard_index_url if current_user.try(:registration_form).try(:current_step) <= position
  end
end
