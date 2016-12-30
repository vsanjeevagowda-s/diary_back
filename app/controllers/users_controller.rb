class UsersController < Devise::RegistrationsController

	def index
		@users = User.all
		render json: {
			data: @users
		}
	end

	def create
		@user = User.new(user_params)
		if params[:user][:code]=="2254"
			if @user.save
				render json: {
					message: "Success",
					data: @user,
					status: 200
				}
			else
				render json: {
					message: "Failed to create user",
					errors: @user.errors,
					status: 201
				}
			end
		else
			render json: {
				message: "Invalid code",
				status: 201
			}
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			render json: {
				message: "Success",
				data: @user,
				status: 200
			}
		else
			render json: {
				message: "Failed to update user",
				errors: @user.errors,
				status: 201
			}
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.delete
			render json: {
				message: "Success"
			}
		else
			render json: {
				message: "Failed to delete user"
			}
		end
	end

	private
	def user_params
		params.require("user").permit(:email, :password, :password_confirmation)
	end
end
