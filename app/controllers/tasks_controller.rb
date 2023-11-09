class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section
  before_action :set_task, only: %i[edit update destroy]
  before_action :authorize_user

  def new
    @task = Task.new
  end

  def create
    @task = @section.tasks.new(task_params)
    if @task.save
      render
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      render
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def set_section
    @section = Section.find_by(id: params[:section_id])
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def authorize_user
    authorize @section.to_do_list, :update?
  end
end
