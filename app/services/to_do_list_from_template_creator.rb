class ToDoListFromTemplateCreator < ApplicationService
  attr_accessor :template

  def initialize(template)
    @template = template  
  end

  def call
    copied = template.deep_clone(include: {sections: :tasks}) do |original, kopy|
      kopy.is_template = false if kopy.is_a?(ToDoList)
    end
    copied
  end
end