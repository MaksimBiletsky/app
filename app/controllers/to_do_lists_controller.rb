class ToDoListsController < ApplicationController
  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = ToDoList.new(to_do_list_params)
    if @to_do_list.save
      flash[:notice] = "To Do List was successfully created."
      render
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def to_do_list_params
    params.require(:to_do_list).permit(:title, :description)
  end
end
