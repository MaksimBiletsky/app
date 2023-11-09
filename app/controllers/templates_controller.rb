class TemplatesController < ApplicationController
  
  before_action :set_to_do_list, only: %i[new create]
  
  def index
    @templates = ToDoList.templates
  end

  def new
    @template = ToDoList.new(is_template: true)
  end

  def create
    if TemplateCreator.call(@to_do_list, params.dig(:to_do_list, :title))
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