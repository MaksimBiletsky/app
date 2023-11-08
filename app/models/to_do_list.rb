class ToDoList < ApplicationRecord
  validates :title, presence: true

  has_many :sections, dependent: :destroy
end
