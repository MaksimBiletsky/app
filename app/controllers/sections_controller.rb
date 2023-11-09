class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_to_do_list
  before_action :set_section, only: %i[edit update destroy]
  before_action :authorize_user

  def new
    @section = Section.new
  end

  def create
    @section = @to_do_list.sections.new(section_params)
    if @section.save
      render
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @section.update(section_params)
      render
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section.destroy
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end

  def set_to_do_list
    @to_do_list = ToDoList.find_by(id: params[:to_do_list_id])
  end

  def set_section
    @section = Section.find_by(id: params[:id])
  end

  def authorize_user
    authorize @to_do_list, :update?
  end
end
