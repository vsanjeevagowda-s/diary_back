class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

    def authenticate_user_using_token
    	token= params["auth_token"]  if params["auth_token"].present?
    	if user= token && User.find_by_auth_token(token.to_s)
        sign_in user, store: false
      else
        render json:{
          message: "User not logged in",
          status: 201
        }
      end
    end
end
