class ExpensesController < ApplicationController

	 before_action :authenticate_user!

	def index
		user = current_user
	    @expenses = Expense.order("date ")
	    if params[:concept] or params[:category_id]
	      	  @expenses = Expense.search(user.id, params[:concept], params[:category_id].to_i).order("date DESC")
	    else
	      	  @expenses = Expense.where("id = ? ", "#{user.id}").order("date DESC")
	    end   
	end
end


