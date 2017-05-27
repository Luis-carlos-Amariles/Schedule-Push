class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :user_active!

  protected

  # use for only login users active
  def user_active!
 		if current_user && current_user.active == false
 			sign_out current_user
 			redirect_to new_user_session_path, notice:"You don't have permissions."
 		end
  end
end
