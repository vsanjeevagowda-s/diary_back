class SessionsController < Devise::SessionsController
	before_action :authenticate_user_using_token, :only => [:logout]

	def create
		# binding.pry
		user = User.find_for_database_authentication(email: params[:email])
		if user && user.valid_password?(params[:password])
			token = user.ensure_authtoken
			render json:{
				message: "success",
				auth_token: token,
				status: 200
			}
		else
			render json:{
				message: "failed",
				status: :unauthorized
			}
		end
	end

	def logout
		# binding.pry
		if current_user
			current_user.auth_token=nil
			current_user.save
			render json:{
				message: "User logged out successfuly ",
				status: 200
			}
		else
			render json:{
				message: "User not logged in",
				status: 201
			}
		end
	end
end