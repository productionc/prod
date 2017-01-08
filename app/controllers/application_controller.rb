class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up).push(:name, :phone_no, :place_of_study, :passed_out_year, :registration_type, :dept, :official_email_id, :company)
	  devise_parameter_sanitizer.for(:account_update).push(:name, :phone_no, :place_of_study, :passed_out_year, :registration_type, :dept, :official_email_id, :company)
	end
end
