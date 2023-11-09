class ToDoListPolicy < ApplicationPolicy
  attr_reader :user, :to_do_list

  def initialize(user, to_do_list)
    @user = user
    @to_do_list = to_do_list
  end

  def update?
    to_do_list.user == user && !to_do_list.is_template
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
