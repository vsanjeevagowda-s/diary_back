class ExpensesController < ApplicationController
	before_action :authenticate_user_using_token
	def create
		begin
			for i in 0..params["expense"].length-1
				if params["expense"][i]["product"].present? || params["expense"][i]["got"].present? || params["expense"][i]["change"].present?
				if params["expense"][i]["id"].present?
					@expense = Expense.find(params["expense"][i]["id"])
					@expense.product = params["expense"][i]["product"]
					@expense.got = params["expense"][i]["got"]
					@expense.spent = params["expense"][i]["spent"]
					@expense.change = params["expense"][i]["change"]
					@expense.save
				else

					@expense = Expense.new
					@expense.date = params["date"]
					@expense.product = params["expense"][i]["product"]
					@expense.got = params["expense"][i]["got"]
					@expense.spent = params["expense"][i]["spent"]
					@expense.change = params["expense"][i]["change"]
					@expense.user_id = current_user.id
					@expense.save
				end
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

	def delete
		begin
		current_user.expenses.find(params["expense_id"]).delete
		render json: {
				message: "record deleted success",
				status: 200
			}
		rescue
			render json: {
				message: "failed to remove expense record",
				status: 201
			}

		end
	end
end