class DashboardController < ApplicationController
  def index
    @to_do_lists = ToDoList.all
    render
  end
end
