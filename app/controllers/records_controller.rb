class RecordsController < ApplicationController
	before_action :authenticate_user_using_token
	def create
		current_user.records << Record.new(record_params)
		@record = current_user.records.last
		render json:{
				message: "success",
				data: @record
			}
	end

	private
	def record_params
		params.require("record").permit(:title)
	end
end
