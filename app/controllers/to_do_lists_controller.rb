class ToDoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_to_do_list, only: %i[edit update destroy move]
  before_action :authorize_user, only: %i[edit update destroy]

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

  def create_from_template
    template = ToDoList.templates.find_by(id: params.dig(:to_do_list, :template_id))
    @to_do_list = ToDoListFromTemplateCreator.call(template, Current.user)
    if @to_do_list.save
      render :create
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

  def move
    @to_do_list.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def to_do_list_params
    params.require(:to_do_list).permit(:title, :description)
  end

  def set_to_do_list
    @to_do_list = ToDoList.find_by(id: params[:id])
  end

  def authorize_user
    authorize @to_do_list
  end
end
