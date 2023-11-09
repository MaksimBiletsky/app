class ToDoListFromTemplateCreator < ApplicationService
  attr_accessor :template, :user

  def initialize(template, _user)
    @template = template
  end

  def call
    template.deep_clone(include: { sections: :tasks }) do |_original, kopy|
      if kopy.is_a?(ToDoList)
        kopy.is_template = false
        kopy.user = user
      end
    end
  end
end
