class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  	devise_parameter_sanitizer.for(:sign_up) << :rollnum
  	devise_parameter_sanitizer.for(:sign_up) << :portfolio

  	devise_parameter_sanitizer.for(:account_update) << :name
  	devise_parameter_sanitizer.for(:account_update) << :rollnum
  end

  def after_sign_in_path_for(coordiantor)
    coordinator_index_path
  end

  # def after_sign_in_path_for(student_member)
  #   student_member_index_path
  # end

  def after_sign_up_path_for(coordiantor)
    new_coordinator_registration_path
  end

  # def after_sign_up_path_for(student_member)
  #   new_student_member_registration_path
  # end
end
