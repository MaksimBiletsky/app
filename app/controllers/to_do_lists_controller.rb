class ToDoListsController < ApplicationController
  
  before_action :set_to_do_list, only: %i[edit update destroy]
  
  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = ToDoList.new(to_do_list_params)
    if @to_do_list.save
      render
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @to_do_list.update(to_do_list_params)
      render
    else
      render :edit, status: :unprocessable_entity
    end    
  end

  def destroy
    @to_do_list.destroy
  end

  private

  def to_do_list_params
    params.require(:to_do_list).permit(:title, :description)
  end

  def set_to_do_list
    @to_do_list = ToDoList.find_by(id: params[:id])
  end
end
