class TemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_to_do_list, only: %i[new create]

  def index
    @templates = ToDoList.templates.where(user: Current.user)
  end

  def new
    @template = ToDoList.new(is_template: true)
  end

  def create
    @template = TemplateCreator.call(@to_do_list, params.dig(:to_do_list, :title))
    if @template.save
      flash[:notice] = "Template successfully created."
    else
      flash[:error] = "Something went wrong."
    end
  end

  private

  def set_to_do_list
    @to_do_list = ToDoList.find_by(id: params[:to_do_list_id])
  end
end
