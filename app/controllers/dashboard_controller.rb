class DashboardController < ApplicationController
  def index
    @my_to_do_lists = ToDoList.where(user: current_user) if current_user
    @to_do_lists = ToDoList.where.not(user: current_user)
    render
  end
end
