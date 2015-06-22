class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # ControllerAuthentication is in the lib directory
  # File contains settings for user authentication
  include ControllerAuthentication

  protect_from_forgery with: :exception
end
