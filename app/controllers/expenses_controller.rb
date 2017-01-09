class ExpensesController < ApplicationController
	before_action :authenticate_user_using_token
	def create
		begin
			for i in 0..params["expense"].length-1
				if params["expense"][i]["id"].present?
					@expense = Expense.find(params["expense"][i]["id"])
					@expense.product = params["expense"][i]["product"]
					@expense.price = params["expense"][i]["price"]
					@expense.save
				else

					@expense = Expense.new
					@expense.date = params["date"]
					@expense.product = params["expense"][i]["product"]
					@expense.price = params["expense"][i]["price"]
					@expense.user_id = current_user.id
					@expense.save
				end
			end
			render json: {
				message: "success",
				status: 200
			}
		rescue
			render json: {
				message: "failed to record expense",
				status: 201
			}
		end
	end

	def todays_expense
		today_expense =[]
		begin
		@expense = current_user.expenses
		for i in 0..@expense.length-1
			if @expense[i].date == params["date"]
					today_expense <<  @expense[i]
			end
		end

			render json: {
				message: "success",
				today_expense: today_expense,
				status: 200
			}
		rescue
			render json: {
				message: "failed",
				status: 201
			}
		end
	end
end