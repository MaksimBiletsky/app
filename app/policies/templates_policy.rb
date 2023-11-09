class TemplatePolicy < ApplicationPolicy
  attr_reader :user, :template

  def initialize(user, template)
    @user = user
    @template = template
  end

  def index?
    template.user == user
  end

  def new?
    true
  end

  def create?
    true
  end
end