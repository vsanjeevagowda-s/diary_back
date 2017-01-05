class RecordsController < ApplicationController
	before_action :authenticate_user_using_token
	def create
		begin
			current_user.records << Record.new(record_params)
			@record = current_user.records.last
			render json:{
				message: "success",
				data: @record,
				status: 200
			}
		rescue
			render json:{
				message: "failed to create record",
				status: 201
			}
		end
	end


	def edit
		begin
			@record = Record.find(params[:id])
			render json:{
				data: @record
			}
		rescue
			render json:{
				message: "record not found",
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

	private
	def record_params
		params.require("record").permit(:morning, :date, :afternoon, :evening, :night, :place, :comments)
	end
end
