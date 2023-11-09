class ToDoListFromTemplateCreator < ApplicationService
  attr_accessor :template, :user

  def initialize(template, user)
    @template = template  
  end

  def call
    copied = template.deep_clone(include: {sections: :tasks}) do |original, kopy|
      if kopy.is_a?(ToDoList)
        kopy.is_template = false 
        kopy.user = user
      end
    end
    copied
  end
end