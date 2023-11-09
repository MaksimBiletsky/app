class DashboardController < ApplicationController
  def index
    @my_to_do_lists = ToDoList.where(user: Current.user) if Current.user
    @to_do_lists = ToDoList.where.not(user: Current.user)
    render
  end
end
