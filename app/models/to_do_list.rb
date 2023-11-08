class ToDoList < ApplicationRecord
  validates :title, presence: true
end
