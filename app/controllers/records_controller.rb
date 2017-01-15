class RecordsController < ApplicationController
	before_action :authenticate_user_using_token
	
	def create
		begin
			if params["record"][0]["id"].present?
				@record = current_user.records.find(params["record"][0]["id"])
				@record.update_attributes(record_params)
				render json:{
					data: @record,
					message: 'success',
					status: 200
				}
			else
				@record = Record.new(record_params)
				@record.date = params["date"] 
				@record.user_id = current_user.id
				@record.save
				render json:{
					data: @record,
					message: 'success',
					status: 200
				}
			end
		rescue
			render json:{
				message: 'fail',
				status: 201
			}
		end

	end

	def index
		@records = current_user.records
		render json:{
			data: @records
		}
	end

	def todays_record
		begin
			@todays_record = current_user.records.where(date: params["date"])
			render json:{
				data: @todays_record,
				message: "success",
				status: 200
			}
		rescue
			render json:{
				message: "fail",
				status: 201
			}
		end
	end

	def update
		begin
			@record = Record.find(params[:id])
			@record.update_attributes(record_params)
			render json:{
				data: @record
			}
		rescue
			render json:{
				message: "failed to update/record not found",
				status: 201
			}
		end
	end

	def destroy
		begin
			@record = Record.find(params[:id])  
			@record.delete
			render json:{
				message: "success",
				status: 200
			}
		rescue
			render json:{
				message: "record not found",
				status: 201
			}
		end
	end



	def record_and_expense
		
	end

	private
	def record_params
		params.require("record")[0].permit(:morning, :afternoon, :evening, :night, :place, :comments, :evening, :night, :sleep, :water, :exercise,:health, :bath, :read)
	end
end
