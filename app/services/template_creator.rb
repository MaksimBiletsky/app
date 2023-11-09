class TemplateCreator < ApplicationService
  attr_accessor :to_do_list, :title

  def initialize(to_do_list, title)
    @to_do_list = to_do_list
    @title = title
  end

  def call
    to_do_list.deep_clone(include: { sections: :tasks }) do |_original, kopy|
      if kopy.is_a?(ToDoList)
        kopy.is_template = true
        kopy.title = title
      end
    end
  end
end
