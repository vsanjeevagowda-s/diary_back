class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate_user_using_token
  	# binding.pry
  	if params[:auth_token].present?
  	user = User.find_by_auth_token(params[:auth_token])
  	if user
  		sign_in user, store: false
  	end
  end
  end
end
